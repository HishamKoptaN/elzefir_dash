/// وصف حقل نصي قابل للتحرير في مستند `settings/general`.
/// المفتاح هو نفسه الذي يقرأه الموقع العام، لذا إضافة نص جديد تحتاج وصفاً هنا.
class SiteContentField {
  const SiteContentField({
    required this.key,
    required this.label,
    required this.fallback,
    this.multiline = false,
  });

  final String key;
  final String label;
  final String fallback;
  final bool multiline;
}
