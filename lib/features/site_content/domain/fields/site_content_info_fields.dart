import '../site_content_field.dart';

/// عناوين ومقدمات صفحات المعلومات الأربع في الموقع العام.
class SiteInfoFields {
  static const fields = [
    SiteContentField(key: 'about_page_badge', label: 'من نحن - الشارة', fallback: 'عراقة وخبرة 20 عاماً'),
    SiteContentField(key: 'about_page_title', label: 'من نحن - العنوان', fallback: 'من نحن - مطعم أسماك الزفر'),
    SiteContentField(key: 'about_page_subtitle', label: 'من نحن - العنوان الفرعي', fallback: 'رواد تقديم المأكولات البحرية والأسماك الطازجة في العياط والجيزة'),
    SiteContentField(key: 'about_page_intro', label: 'من نحن - المقدمة', fallback: 'في مطعم أسماك الزفر، نفتخر برحلة تمتد لأكثر من 20 عاماً في عالم المأكولات البحرية، حيث نجمع بين الطعم المصري الأصيل والجودة الفائقة. بدأت رحلتنا بشغف تقديم أجود أنواع الأسماك البحرية والنيلية الطازجة يومياً مباشرة من شباك الصيادين إلى مائدتك.', multiline: true),
    SiteContentField(key: 'privacy_page_badge', label: 'الخصوصية - الشارة', fallback: 'الشفافية وحماية البيانات'),
    SiteContentField(key: 'privacy_page_title', label: 'الخصوصية - العنوان', fallback: 'سياسة الخصوصية'),
    SiteContentField(key: 'privacy_page_updated', label: 'الخصوصية - تاريخ التحديث', fallback: 'آخر تحديث: 11 أكتوبر 2026'),
    SiteContentField(key: 'privacy_page_intro', label: 'الخصوصية - المقدمة', fallback: 'أهلاً بكم في موقع وتطبيق مطعم أسماك الزفر. نحن نلتزم باحترام خصوصيتكم وحماية بياناتكم الشخصية بما يتوافق مع أعلى المعايير القانونية وإرشادات الخصوصية العالمية وسياسات Google AdSense. توضح هذه الوثيقة طبيعة المعلومات التي نقوم بجمعها وكيفية معالجتها واستخدامها وحمايتها.', multiline: true),
    SiteContentField(key: 'terms_page_badge', label: 'الشروط - الشارة', fallback: 'شروط الاستخدام'),
    SiteContentField(key: 'terms_page_title', label: 'الشروط - العنوان', fallback: 'الشروط والأحكام'),
    SiteContentField(key: 'terms_page_updated', label: 'الشروط - تاريخ التحديث', fallback: 'آخر تحديث: 11 أكتوبر 2026'),
    SiteContentField(key: 'terms_page_intro', label: 'الشروط - المقدمة', fallback: 'مرحباً بكم في موقع مطعم أسماك الزفر. تنطبق هذه الشروط والأحكام على استخدامك للموقع الإلكتروني وكافة الخدمات والمنتجات الرقمية والطلبات المرتبطة بمطعمنا. باستخدامك لهذا الموقع أو تقديمك لأي طلب عبره، فإنك توافق التزامك الكامل بهذه الشروط.', multiline: true),
    SiteContentField(key: 'contact_page_badge', label: 'اتصل بنا - الشارة', fallback: 'خدمة العملاء والطلبات'),
    SiteContentField(key: 'contact_page_title', label: 'اتصل بنا - العنوان', fallback: 'تواصل معنا - مطعم أسماك الزفر'),
    SiteContentField(key: 'contact_page_subtitle', label: 'اتصل بنا - العنوان الفرعي', fallback: 'نسعد دائماً باستقبال اتصالاتكم وطلباتكم خلال ساعات العمل'),
    SiteContentField(key: 'contact_page_intro', label: 'اتصل بنا - المقدمة', fallback: 'سواء كنت ترغب في الاستفسار عن أصناف الأسماك الطازجة المتاحة اليوم، أو تقديم طلب توصيل سريع إلى باب منزلك، أو تجهيز عزومة ومأدبة بحرية خاصة، فإن فريق عمل مطعم أسماك الزفر جاهز لخدمتكم ومساعدتكم.', multiline: true),
    SiteContentField(key: 'contact_phone_label', label: 'اتصل بنا - عنوان الهاتف', fallback: 'الهاتف المباشر (أورنج)'),
    SiteContentField(key: 'contact_whatsapp_label', label: 'اتصل بنا - عنوان واتساب', fallback: 'واتساب وخدمة العملاء (إتصالات)'),
    SiteContentField(key: 'contact_address_label', label: 'اتصل بنا - عنوان العنوان', fallback: 'العنوان والفرع'),
    SiteContentField(key: 'privacy_sections_json', label: 'أقسام سياسة الخصوصية', fallback: '', multiline: true),
    SiteContentField(key: 'terms_sections_json', label: 'أقسام الشروط والأحكام', fallback: '', multiline: true),
    SiteContentField(key: 'about_sections_json', label: 'أقسام صفحة من نحن', fallback: '', multiline: true),
    SiteContentField(key: 'about_features_json', label: 'ميزات من نحن', fallback: '', multiline: true),
    SiteContentField(key: 'about_features_title', label: 'عنوان قسم الميزات', fallback: 'ما يميز مطعم أسماك الزفر'),
    SiteContentField(key: 'about_cta_title', label: 'عنوان صندوق الطلب', fallback: 'هل أنت جاهز لتجربة أشهى وجبة بحرية؟'),
    SiteContentField(key: 'about_cta_subtitle', label: 'وصف صندوق الطلب', fallback: 'اطلب الآن أو شرفنا بالزيارة في فرعنا بالعياط - شارع الجيش'),
    SiteContentField(key: 'about_cta_phone', label: 'رقم صندوق الطلب', fallback: '01008673836'),
    SiteContentField(key: 'hero_image_url', label: 'رابط صورة الهيرو', fallback: ''),
    SiteContentField(key: 'gallery_items_json', label: 'شرائح المعرض', fallback: '', multiline: true),
  ];
}
