const admin = require('firebase-admin');
const serviceAccount = require('./serviceAccountKey.json');
const products = require('./products.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

async function seedProducts() {
  try {
    const batch = db.batch();
    products.forEach((product) => {
      const docRef = db.collection('products').doc(product.id.toString());
      batch.set(docRef, product);
    });
    await batch.commit();
    console.log('Products seeded successfully to Firestore!');
  } catch (error) {
    console.error('Error seeding products:', error);
  }
}

seedProducts();
