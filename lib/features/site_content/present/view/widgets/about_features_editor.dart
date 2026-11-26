import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/widgets/forms/custom_text_form_field.dart';
import '../../../../../core/widgets/forms/form_section_card.dart';
import '../../controller/site_content_controller.dart';

/// ميزات صفحة «من نحن». كل سطر: `العنوان | الوصف`.
class AboutFeaturesEditor extends StatelessWidget {
  const AboutFeaturesEditor({super.key, required this.controller});

  static const settingKey = 'about_features_json';

  final SiteContentController controller;

  List<Map<String, String>> _features() {
    final raw = controller.valueOf(settingKey).trim();
    if (raw.isEmpty) return const [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return const [];
      return [
        for (final item in decoded)
          if (item is Map<String, dynamic>)
            {
              'title': item['title']?.toString() ?? '',
              'description': item['description']?.toString() ?? '',
            },
      ];
    } catch (_) {
      return const [];
    }
  }

  void _write(List<Map<String, String>> features) {
    controller.setValue(settingKey, jsonEncode(features));
  }

  static String _toText(List<Map<String, String>> features) {
    return features
        .map((f) => '${f['title']} | ${f['description']}')
        .join('\n');
  }

  static List<Map<String, String>> _parse(String text) {
    return [
      for (final line in text.split('\n'))
        if (line.trim().isNotEmpty)
          () {
            final parts = line.split('|');
            return {
              'title': parts.isNotEmpty ? parts.first.trim() : '',
              'description': parts.length > 1
                  ? parts.sublist(1).join('|').trim()
                  : '',
            };
          }(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FormSectionCard(
      icon: Icons.star_border_rounded,
      tint: context.colorScheme.secondary,
      title: 'ميزات من نحن',
      subtitle: 'اتركها فارغة لاستخدام القائمة الافتراضية',
      children: [
        CustomTextFormField(
          width: .infinity,
          initialValue: _toText(_features()),
          maxLines: 6,
          onChanged: (value) => _write(_parse(value)),
        ),
        Text(
          'صيغة كل سطر: العنوان | الوصف',
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
