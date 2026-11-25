import '../site_content_field.dart';

/// بيانات التواصل وروابطها كما تظهر في التذييل وأزرار الاتصال السريع.
class SiteContactFields {
  static const fields = [
    SiteContentField(
      key: 'contact_title',
      label: 'عنوان قسم التواصل',
      fallback: 'تواصل معنا',
    ),
    SiteContentField(
      key: 'phone_label',
      label: 'رقم الهاتف الظاهر',
      fallback: '01008673836',
    ),
    SiteContentField(
      key: 'phone_url',
      label: 'رابط الاتصال',
      fallback: 'tel:01008673836',
    ),
    SiteContentField(
      key: 'whatsapp_number',
      label: 'رقم واتساب (بدون +)',
      fallback: '201124497981',
    ),
    SiteContentField(
      key: 'whatsapp_label',
      label: 'رقم واتساب الظاهر',
      fallback: '01124497981',
    ),
    SiteContentField(
      key: 'address_label',
      label: 'العنوان الظاهر',
      fallback: 'العياط غرب - شارع الجيش - أمام سلم السكة الحديد بجوار صيدلية -د. لويز',
      multiline: true,
    ),
    SiteContentField(
      key: 'maps_url',
      label: 'رابط الخريطة',
      fallback: 'https://maps.google.com/?q=العياط+شارع+الجيش',
    ),
    SiteContentField(
      key: 'facebook_url',
      label: 'رابط فيسبوك',
      fallback: 'https://www.facebook.com/ELZEFIR',
    ),
    SiteContentField(
      key: 'instagram_url',
      label: 'رابط إنستغرام',
      fallback: 'https://www.instagram.com/elzefir_fish',
    ),
  ];
}
