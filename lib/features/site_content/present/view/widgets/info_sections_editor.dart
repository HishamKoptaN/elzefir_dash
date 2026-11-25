import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/widgets/forms/form_section_card.dart';
import '../../../domain/info_section_draft.dart';
import '../../controller/site_content_controller.dart';
import 'info_section_card.dart';

/// محرر أقسام صفحة معلومات واحدة، يحفظ النتيجة كـ JSON في نفس مستند الإعدادات.
class InfoSectionsEditor extends StatelessWidget {
  const InfoSectionsEditor({
    super.key,
    required this.controller,
    required this.settingKey,
    required this.title,
  });

  final SiteContentController controller;
  final String settingKey;
  final String title;

  List<InfoSectionDraft> _drafts() {
    final raw = controller.valueOf(settingKey).trim();
    if (raw.isEmpty) return const [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return const [];
      return [
        for (final item in decoded)
          if (item is Map<String, dynamic>) InfoSectionDraft.fromJson(item),
      ];
    } catch (_) {
      return const [];
    }
  }

  void _write(List<InfoSectionDraft> drafts) {
    controller.setValue(
      settingKey,
      jsonEncode(drafts.map((draft) => draft.toJson()).toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final drafts = _drafts();
    return FormSectionCard(
      icon: Icons.list_alt_outlined,
      tint: context.colorScheme.primary,
      title: title,
      subtitle: 'اتركها فارغة لاستخدام النص الافتراضي في الموقع',
      children: [
        for (final (index, section) in drafts.indexed)
          InfoSectionCard(
            index: index,
            section: section,
            onChanged: (updated) {
              final next = List<InfoSectionDraft>.from(drafts);
              next[index] = updated;
              _write(next);
            },
            onRemove: () {
              final next = List<InfoSectionDraft>.from(drafts);
              next.removeAt(index);
              _write(next);
            },
          ),
        if (drafts.isEmpty)
          Text(
            'لا توجد أقسام محفوظة بعد',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        OutlinedButton.icon(
          onPressed: () => _write([...drafts, const InfoSectionDraft()]),
          icon: const Icon(Icons.add),
          label: const Text('إضافة قسم'),
        ),
        SizedBox(height: 4.h),
      ],
    );
  }
}
