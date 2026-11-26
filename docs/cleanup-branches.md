# فروع التنظيف والمراجعة النهائية

هذا الملف يوثّق فروع التنظيف التي أُنشئت بعد الانتهاء من ربط محتوى الموقع بالداشبورد، وأثر كل فرع على `flutter analyze`. الأرقام قبل/بعد هي عدد ملاحظات `info`؛ لم توجد أخطاء أو تحذيرات في أي فرع.

## التطبيق (`elzefir`)

| الفرع | ما أصلحه | أثر analyze |
|---|---|---|
| `chore/with-opacity-cleanup` | استبدال 67 استخداماً لـ `withOpacity` بـ `.withValues(alpha:)` في 27 ملفاً | 328 → 270 |
| `chore/declare-missing-packages` | إعلان `intl`, `bloc`, `rxdart`, واجهات Firebase، و`flutter_web_plugins` في `pubspec.yaml` | −16 ملاحظة |
| `chore/remove-unnecessary-imports` | حذف 7 استيرادات غير مستخدمة في 6 ملفات | −7 ملاحظات |
| `chore/file-names-cleanup` | إعادة تسمية 7 ملفات إلى `snake_case` وتحديث مراجعها | −7 ملاحظات |
| `chore/private-types-cleanup` | جعل دوال المساعدة التي تستقبل حالات خاصة خاصة، وحذف دالتين ميتتين | −5 ملاحظات |
| `chore/build-context-async-cleanup` | حماية رسائل `email_view.dart` بفحص `context.mounted` بعد العملية غير المتزامنة | −2 ملاحظة |
| `chore/remove-dead-fields` | حذف `cookingMethods` و`CookingMethodModel/Entity` و`isMostPopular` من نماذج المنتجات | لا أثر على analyze |
| `feature/offer-card` | تفعيل بطاقة العرض وربط محتواها بـ `settings/general` | لا أثر على analyze |

**الحالة:** كل فروع المحتوى مدمجة في `dev` عدا `feature/offer-card` و`chore/remove-dead-fields`. ترتيب الدمج المقترح: `feature/offer-card` ← `chore/remove-dead-fields` ← فروع التنظيف بالترتيب أعلاه ← `docs/cleanup-branches`.

## الداشبورد (`elzefir_dash`)

| الفرع | ما أصلحه | أثر analyze |
|---|---|---|
| `chore/declare-missing-packages` | إعلان الحزم المستوردة مباشرة في `pubspec.yaml` | 236 → 221 |
| `chore/file-names-cleanup` | إعادة تسمية 4 ملفات إلى `snake_case` وتحديث مراجعها | −4 ملاحظات |
| `chore/private-types-cleanup` | جعل دوال المساعدة الخاصة بحالات BLoC خاصة | −4 ملاحظات |
| `chore/build-context-async-cleanup` | حماية رسائل `email_view.dart` بفحص `context.mounted` | −2 ملاحظة |
| `chore/remove-dead-fields` | التوقف عن كتابة `price_updated_at` وتحديث التوثيق | لا أثر على analyze |

**الحالة:** كل فروع المحتوى والتنظيف ما زالت على الـ remote (لم تُدمج). الترتيب المقترح: سلسلة `feature/most-requested-control` ← `feature/site-content-settings` ← `feature/site-content-contact` ← `feature/site-content-info-pages` ← `feature/site-content-sections` ← `feature/site-content-about-sections` ← `feature/site-content-images` ← `feature/dish-options` ← `feature/delete-products-categories` ← `feature/fill-firestore-gaps` ← `feature/nav-labels-order` ← `docs/firestore-keys` ← `feature/offer-card` ← `chore/remove-dead-fields` ← فروع التنظيف بالترتيب أعلاه ← `docs/cleanup-branches`.

## المتبقي

كل الملاحظات المتبقية من نوع `deprecated_member_use` بسبب ترقية Flutter إلى 3.47 (استيراد `package:flutter/material.dart` وواجهات مثل `Radio.groupValue`). لا تؤثر على البناء، ولم تُنشأ فروع إضافية لإصلاحها.
