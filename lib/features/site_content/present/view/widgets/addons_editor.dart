import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/widgets/forms/custom_text_form_field.dart';
import '../../../../../core/widgets/forms/form_section_card.dart';
import '../../controller/site_content_controller.dart';

/// الإضافات الاختيارية في صفحة الطبق. السطر: `id | العنوان | الوصف | التكلفة`.
class AddonsEditor extends StatelessWidget {
  const AddonsEditor({super.key, required this.controller});

  static const settingKey = 'addons_json';
  static const _keys = ['id', 'title', 'subtitle', 'cost'];

  final SiteContentController controller;

  List<Map<String, String>> _items() {
    final raw = controller.valueOf(settingKey).trim();
    if (raw.isEmpty) return const [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return const [];
      return [
        for (final item in decoded)
          if (item is Map<String, dynamic>)
            {
              for (final key in _keys) key: item[key]?.toString() ?? '',
            },
      ];
    } catch (_) {
      return const [];
    }
  }

  void _write(List<Map<String, String>> items) {
    controller.setValue(settingKey, jsonEncode(items));
  }

  static String _toText(List<Map<String, String>> items) {
    return items
        .map((item) => _keys.map((key) => item[key] ?? '').join(' | '))
        .join('\n');
  }

  static List<Map<String, String>> _parse(String text) {
    return [
      for (final line in text.split('\n'))
        if (line.trim().isNotEmpty)
          () {
            final parts = line.split('|');
            return {
              for (final (index, key) in _keys.indexed)
                key: index < parts.length ? parts[index].trim() : '',
            };
          }(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FormSectionCard(
      icon: Icons.add_circle_outline,
      tint: context.colorScheme.primary,
      title: 'الأطباق الجانبية',
      subtitle: 'اتركها فارغة لاستخدام القائمة الافتراضية',
      children: [
        CustomTextFormField(
          width: .infinity,
          initialValue: _toText(_items()),
          maxLines: 5,
          onChanged: (value) => _write(_parse(value)),
        ),
        Text(
          'السطر: id | العنوان | الوصف | التكلفة',
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
