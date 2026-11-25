import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/widgets/forms/custom_text_form_field.dart';
import '../../../../../core/widgets/forms/form_section_card.dart';
import '../../controller/site_content_controller.dart';

/// شرائح المعرض. كل سطر: `رابط الصورة | العنوان | الوصف`.
class GalleryItemsEditor extends StatelessWidget {
  const GalleryItemsEditor({super.key, required this.controller});

  static const settingKey = 'gallery_items_json';

  final SiteContentController controller;

  List<Map<String, String>> _slides() {
    final raw = controller.valueOf(settingKey).trim();
    if (raw.isEmpty) return const [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return const [];
      return [
        for (final item in decoded)
          if (item is Map<String, dynamic>)
            {
              'image': item['image']?.toString() ?? '',
              'title': item['title']?.toString() ?? '',
              'caption': item['caption']?.toString() ?? '',
            },
      ];
    } catch (_) {
      return const [];
    }
  }

  void _write(List<Map<String, String>> slides) {
    controller.setValue(settingKey, jsonEncode(slides));
  }

  static const _keys = ['image', 'title', 'caption'];

  static String _toText(List<Map<String, String>> slides) {
    return slides
        .map((slide) => _keys.map((key) => slide[key] ?? '').join(' | '))
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
      icon: Icons.photo_library_outlined,
      tint: context.colorScheme.primary,
      title: 'شرائح المعرض',
      subtitle: 'اتركها فارغة لاستخدام الصور الافتراضية',
      children: [
        CustomTextFormField(
          width: .infinity,
          initialValue: _toText(_slides()),
          maxLines: 6,
          onChanged: (value) => _write(_parse(value)),
        ),
        Text(
          'صيغة كل سطر: رابط الصورة | العنوان | الوصف',
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
