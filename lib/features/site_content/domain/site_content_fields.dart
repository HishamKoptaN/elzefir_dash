import 'site_content_about_fields.dart';
import 'site_content_contact_fields.dart';
import 'site_content_field.dart';

/// حقول نصوص الصفحة الرئيسية التي يملك المشرف تعديلها.
class SiteContentFields {
  static const hero = [
    SiteContentField(
      key: 'hero_eyebrow_brand',
      label: 'اسم المطعم في الواجهة',
      fallback: 'مطعم أسماك الزفر',
    ),
    SiteContentField(
      key: 'hero_eyebrow_tagline',
      label: 'عبارة الواجهة العلوية',
      fallback: 'طازج يومياً',
    ),
    SiteContentField(
      key: 'hero_headline_1',
      label: 'عنوان الواجهة - السطر الأول',
      fallback: 'طعم البحر',
    ),
    SiteContentField(
      key: 'hero_headline_2',
      label: 'عنوان الواجهة - السطر الثاني',
      fallback: 'الأصيل',
    ),
    SiteContentField(
      key: 'hero_headline_3',
      label: 'عنوان الواجهة - السطر الثالث',
      fallback: 'أجود ما في البحر',
    ),
    SiteContentField(
      key: 'hero_cta_order',
      label: 'نص زر الطلب',
      fallback: 'اطلب الآن',
    ),
    SiteContentField(
      key: 'hero_cta_explore',
      label: 'نص زر استكشاف القائمة',
      fallback: 'استكشف القائمة',
    ),
  ];

  static const sections = [
    SiteContentField(
      key: 'featured_title',
      label: 'عنوان قسم الأطباق',
      fallback: 'أطباق مميزة والأكثر طلباً',
    ),
    SiteContentField(
      key: 'featured_subtitle',
      label: 'وصف قسم الأطباق',
      fallback: 'تحضير طازج على أصوله بالخلطات السرية',
    ),
    SiteContentField(
      key: 'chef_badge',
      label: 'شارة اختيارات الشيف',
      fallback: 'اختيارات الشيف',
    ),
    SiteContentField(
      key: 'prices_title',
      label: 'عنوان المنيو المختصر',
      fallback: 'منيو اليوم المختصر وأسعاره',
    ),
  ];

  static const all = [
    ...hero,
    ...sections,
    ...SiteAboutFields.fields,
    ...SiteContactFields.fields,
  ];
}
