import 'site_content_field.dart';

/// نصوص قسم «من نحن» في الصفحة الرئيسية.
class SiteAboutFields {
  static const fields = [
    SiteContentField(
      key: 'about_body',
      label: 'نبذة عن المطعم',
      fallback:
          'في مطعم الزفر نقدم أفضل أنواع الأسماك والمأكولات البحرية الطازجة، '
          'المحضرة يوميًا بأجود المكونات وعلى أيدي أمهر الطهاة. هدفنا أن نقدم '
          'تجربة مميزة تجمع بين الطعم الأصيل والجودة العالية والخدمة الممتازة.',
      multiline: true,
    ),
    SiteContentField(
      key: 'about_feature_1',
      label: 'ميزة أولى',
      fallback: 'طازج يومياً',
    ),
    SiteContentField(
      key: 'about_feature_2',
      label: 'ميزة ثانية',
      fallback: 'توصيل سريع',
    ),
    SiteContentField(
      key: 'about_feature_3',
      label: 'ميزة ثالثة',
      fallback: 'جودة عالية',
    ),
  ];
}
