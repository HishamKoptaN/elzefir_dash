# خريطة مفاتيح Firestore

مصدر الحقيقة لمحتوى الموقع هو Firestore (مشروع `elzefir-dev`). الداشبورد يكتب، والموقع العام يقرأ مباشرة. الـ Laravel API لا يخدم محتوى الموقع؛ يوفّر فقط التوثيق وتذاكر رفع الصور.

## المستندات والمجموعات

| المسار | الكاتب | القارئ | الحقول |
|---|---|---|---|
| `products/{id}` | الداشبورد | الموقع | `id`, `name`, `title`, `description`, `price`, `priceUnit`, `image`, `category_id`, `isFeatured`, `isMostRequested`, `price_updated_at` |
| `categories/{id}` | الداشبورد | الموقع | `id`, `name`, `image` |
| `settings/working_hours` | الداشبورد | الموقع | `days`, `open`, `close`, `updatedAt` |
| `settings/general` | الداشبورد | الموقع | مفاتيح المحتوى أدناه |
| `stats/visitors` | الموقع | الداشبورد | `firstSeenAt`, `lastSeenAt`, `visits` |
| `visitors/{id}` | الموقع | الداشبورد | `firstSeenAt`, `lastSeenAt`, `visits` |

`price_updated_at` حقل قديم لم يعد يُقرأ؛ `priceUnit` الفارغ يعني «كجم».

## مفاتيح `settings/general` (64 مفتاحاً)

كل مفتاح أدناه مكتوب في الداشبورد ويُقرأ في الموقع. القيمة الافتراضية في الداشبورد مطابقة لافتراض الموقع، فحفظ أي حقل لا يغيّر الحقول الأخرى.

### الهيرو والواجهة
`hero_eyebrow_brand`، `hero_eyebrow_tagline`، `hero_headline_1`، `hero_headline_2`، `hero_headline_3`، `hero_cta_order`، `hero_cta_explore`، `hero_image_url`، `featured_title`، `featured_subtitle`، `chef_badge`، `prices_title`.

### من نحن
`about_title`، `about_body`، `about_feature_1..3`، `about_page_badge`، `about_page_title`، `about_page_subtitle`، `about_page_intro`، `about_sections_json`، `about_features_json`، `about_features_title`، `about_cta_title`، `about_cta_subtitle`، `about_cta_phone`.

### التواصل
`contact_title`، `phone_label`، `phone_url`، `whatsapp_number`، `whatsapp_label`، `whatsapp_url`، `address_label`، `maps_url`، `facebook_url`، `instagram_url`، `contact_phone_label`، `contact_whatsapp_label`، `contact_address_label`.

### صفحات المعلومات
`privacy_page_badge`، `privacy_page_title`، `privacy_page_updated`، `privacy_page_intro`، `privacy_sections_json`، `terms_page_badge`، `terms_page_title`، `terms_page_updated`، `terms_page_intro`، `terms_sections_json`، `contact_page_badge`، `contact_page_title`، `contact_page_subtitle`، `contact_page_intro`.

### طرق الطهي والإضافات والمعرض
`cooking_methods_json`، `addons_json`، `gallery_items_json`.

### التنقل والترتيب
`nav_home`، `nav_gallery`، `nav_products`، `nav_prices`، `nav_about`، `nav_contact`، `section_order_json`.

## صيغ الحقول المنظّمة (JSON)

| المفتاح | الصيغة |
|---|---|
| `about_sections_json`, `privacy_sections_json`, `terms_sections_json` | `[{id?, title, paragraphs: [..], bullets: [..], linkUrl?, linkLabel?}]` — `id` يُستخدم في «من نحن» بالقيم `mission / services / menu / quality` |
| `about_features_json` | `[{title, description}]` |
| `gallery_items_json` | `[{image, title, caption}]` |
| `cooking_methods_json` | `[{id, title, priceText, cost, badge, description}]` — `badge` تُعرض شارة «الأكثر طلباً 🔥» |
| `addons_json` | `[{id, title, subtitle, cost}]` |
| `section_order_json` | معرّفات مفصولة بفاصلة أو سطر جديد: `hero / gallery / products / prices / about / contact` |

## قاعدة إضافة مفتاح جديد

1. أضف وصف الحقل في `lib/features/site_content/domain/fields/` في الداشبورد بقيمة افتراضية **مطابقة** لما يستخدمه الموقع.
2. اقرأ المفتاح في الموقع عبر `SiteText` للنصوص، أو `info.text(key, fallback)` للقيم داخل معاملات مثل الروابط.
3. للمحتوى المنظّم استخدم صيغة JSON جديدة ووثّقها في الجدول أعلاه.
4. لا تكتب حقلًا جديداً في الداشبورد دون قارئ في الموقع — هذا بالضبط ما سبب فجوتي `whatsapp_url` و`priceUnit` سابقاً.
