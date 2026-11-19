/**
 * One-off migration for the product pricing model.
 *
 * - makes `price` and every `price_variants[].price` a number
 * - drops duplicate `settlement_method_id` entries (first one wins)
 * - sets `price` to the cheapest settlement method price
 * - deletes the legacy `settlement_methods` array from each product
 * - adds `sort_order` / `enabled` to settlement methods
 *
 * Usage:
 *   node scripts/migrate_product_pricing.js             # dry run (default)
 *   node scripts/migrate_product_pricing.js --apply     # write, with backup
 *   node scripts/migrate_product_pricing.js --rollback  # restore the backup
 *
 * Every touched product is copied to `products_migration_backup/{id}` before it
 * is updated, and the backup document is deleted once a rollback restores it.
 */
const admin = require('firebase-admin');
const serviceAccount = require('../serviceAccountKey.json');

admin.initializeApp({ credential: admin.credential.cert(serviceAccount) });
const db = admin.firestore();

const APPLY = process.argv.includes('--apply');
const ROLLBACK = process.argv.includes('--rollback');
const FIELD_DELETE = admin.firestore.FieldValue.delete();

const round2 = (value) => Math.round(value * 100) / 100;

const normalizeDigits = (text) =>
  String(text)
    .replace(/[٠-٩]/g, (d) => String(d.charCodeAt(0) - 0x0660))
    .replace(/[۰-۹]/g, (d) => String(d.charCodeAt(0) - 0x06f0))
    .replace(/٫/g, '.')
    .replace(/[٬,\s_]/g, '');

function parsePrice(value) {
  if (typeof value === 'number') {
    return Number.isFinite(value) && value > 0 ? round2(value) : null;
  }
  if (typeof value !== 'string') return null;
  const text = normalizeDigits(value);
  if (!/^\d+(\.\d+)?$/.test(text)) return null;
  const number = Number(text);
  return Number.isFinite(number) && number > 0 ? round2(number) : null;
}

function priceVariantsOf(product) {
  const raw = product.price_variants;
  const entries = [];
  if (Array.isArray(raw)) {
    for (const item of raw) {
      if (!item || typeof item !== 'object') continue;
      const id = item.settlement_method_id ?? item.settlementMethodId;
      if (id === undefined || id === null) continue;
      entries.push([String(id).trim(), item.price]);
    }
  } else if (raw && typeof raw === 'object') {
    for (const [id, value] of Object.entries(raw)) {
      entries.push([String(id).trim(), value && typeof value === 'object' ? value.price : value]);
    }
  }
  return entries;
}

function buildProductUpdate(product) {
  const prices = new Map();
  let droppedDuplicates = 0;
  let invalidPrices = 0;

  for (const [id, rawPrice] of priceVariantsOf(product)) {
    if (!id) continue;
    const price = parsePrice(rawPrice);
    if (price === null) {
      invalidPrices += 1;
      continue;
    }
    if (prices.has(id)) {
      droppedDuplicates += 1;
      continue;
    }
    prices.set(id, price);
  }

  const variants = [...prices.entries()].map(([id, price]) => ({
    settlement_method_id: id,
    price,
  }));
  const cheapest = variants.length ? Math.min(...variants.map((v) => v.price)) : null;

  const update = { price_variants: variants };
  if (cheapest !== null) update.price = cheapest;
  if (product.settlement_methods !== undefined) update.settlement_methods = FIELD_DELETE;

  return {
    update,
    report: {
      hasLegacyMethods: product.settlement_methods !== undefined,
      stringPrice: typeof product.price === 'string',
      restyledPrice: cheapest !== null && product.price !== cheapest,
      droppedDuplicates,
      invalidPrices,
    },
  };
}

async function migrateProducts() {
  const snapshot = await db.collection('products').get();
  const totals = {
    products: snapshot.size,
    changed: 0,
    legacyMethods: 0,
    stringPrices: 0,
    duplicates: 0,
    invalidPrices: 0,
    priceRealigned: 0,
  };

  let batch = db.batch();
  let pending = 0;

  for (const doc of snapshot.docs) {
    const product = doc.data();
    const { update, report } = buildProductUpdate(product);
    totals.legacyMethods += report.hasLegacyMethods ? 1 : 0;
    totals.stringPrices += report.stringPrice ? 1 : 0;
    totals.duplicates += report.droppedDuplicates;
    totals.invalidPrices += report.invalidPrices;
    totals.priceRealigned += report.restyledPrice ? 1 : 0;

    if (!APPLY) continue;

    batch.set(db.collection('products_migration_backup').doc(doc.id), {
      id: doc.id,
      data: product,
      migrated_at: admin.firestore.FieldValue.serverTimestamp(),
    });
    batch.set(doc.ref, update, { merge: true });
    totals.changed += 1;
    pending += 1;
    if (pending >= 400) {
      await batch.commit();
      batch = db.batch();
      pending = 0;
    }
  }

  if (APPLY && pending > 0) await batch.commit();
  return totals;
}

async function migrateSettlementMethods() {
  const snapshot = await db.collection('settlement_methods').get();
  const total = { methods: snapshot.size, changed: 0 };

  for (const doc of snapshot.docs) {
    const data = doc.data();
    const update = {};
    if (data.enabled === undefined) update.enabled = true;
    if (data.sort_order === undefined) update.sort_order = 0;
    if (Object.keys(update).length === 0) continue;
    total.changed += 1;
    if (APPLY) await doc.ref.set(update, { merge: true });
  }
  return total;
}

async function rollback() {
  const backups = await db.collection('products_migration_backup').get();
  if (backups.empty) {
    console.log('No backup documents found; nothing to roll back.');
    return;
  }
  let restored = 0;
  for (const doc of backups.docs) {
    const { data } = doc.data();
    await db.collection('products').doc(doc.id).set(data);
    await doc.ref.delete();
    restored += 1;
  }
  console.log(`Restored ${restored} product document(s) from backup.`);
}

async function main() {
  if (ROLLBACK) {
    await rollback();
    return;
  }

  const products = await migrateProducts();
  const methods = await migrateSettlementMethods();
  console.log(`Mode: ${APPLY ? 'APPLY (writes + backup)' : 'DRY RUN (no writes)'}`);
  console.log('Products:', products);
  console.log('Settlement methods:', methods);
  if (!APPLY) console.log('Re-run with --apply to write the changes.');
}

main().catch((error) => {
  console.error('Migration failed:', error);
  process.exitCode = 1;
});
