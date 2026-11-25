/// قسم صفحة معلومات كما يظهر في محرر الداشبورد.
/// الفقرات والنقاط تُخزَّن كنص متعدد الأسطر وتُحوَّل إلى قائمة عند الحفظ.
class InfoSectionDraft {
  const InfoSectionDraft({
    this.title = '',
    this.paragraphs = '',
    this.bullets = '',
    this.linkUrl = '',
    this.linkLabel = '',
  });

  final String title;
  final String paragraphs;
  final String bullets;
  final String linkUrl;
  final String linkLabel;

  factory InfoSectionDraft.fromJson(Map<String, dynamic> json) {
    return InfoSectionDraft(
      title: json['title']?.toString() ?? '',
      paragraphs: _lines(json['paragraphs']),
      bullets: _lines(json['bullets']),
      linkUrl: json['linkUrl']?.toString() ?? '',
      linkLabel: json['linkLabel']?.toString() ?? '',
    );
  }

  static String _lines(Object? value) {
    if (value is! List) return '';
    return value.map((e) => e.toString()).join('\n');
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'paragraphs': _nonEmptyLines(paragraphs),
      'bullets': _nonEmptyLines(bullets),
      if (linkUrl.trim().isNotEmpty) 'linkUrl': linkUrl.trim(),
      if (linkLabel.trim().isNotEmpty) 'linkLabel': linkLabel.trim(),
    };
  }

  static List<String> _nonEmptyLines(String value) {
    return value
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();
  }

  InfoSectionDraft copyWith({
    String? title,
    String? paragraphs,
    String? bullets,
    String? linkUrl,
    String? linkLabel,
  }) {
    return InfoSectionDraft(
      title: title ?? this.title,
      paragraphs: paragraphs ?? this.paragraphs,
      bullets: bullets ?? this.bullets,
      linkUrl: linkUrl ?? this.linkUrl,
      linkLabel: linkLabel ?? this.linkLabel,
    );
  }
}
