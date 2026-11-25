import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/widgets/forms/custom_text_form_field.dart';
import '../../../../../core/widgets/forms/form_section_card.dart';
import '../../../../../core/widgets/forms/labeled_field.dart';
import '../../../domain/info_section_draft.dart';

/// بطاقة تحرير قسم واحد: العنوان، الفقرات، ونقاط القائمة.
class InfoSectionCard extends StatelessWidget {
  const InfoSectionCard({
    super.key,
    required this.index,
    required this.section,
    required this.onChanged,
    required this.onRemove,
  });

  final int index;
  final InfoSectionDraft section;
  final ValueChanged<InfoSectionDraft> onChanged;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return FormSectionCard(
      icon: Icons.article_outlined,
      tint: context.colorScheme.secondary,
      title: 'القسم ${index + 1}',
      subtitle: 'سطر لكل فقرة أو نقطة',
      children: [
        _field(
          label: 'عنوان القسم',
          value: section.title,
          onChanged: (value) {
            onChanged(section.copyWith(title: value));
          },
        ),
        _field(
          label: 'الفقرات',
          value: section.paragraphs,
          multiline: true,
          onChanged: (value) {
            onChanged(section.copyWith(paragraphs: value));
          },
        ),
        _field(
          label: 'النقاط',
          value: section.bullets,
          multiline: true,
          onChanged: (value) {
            onChanged(section.copyWith(bullets: value));
          },
        ),
        Align(
          alignment: .centerLeft,
          child: TextButton.icon(
            onPressed: onRemove,
            icon: const Icon(Icons.delete_outline),
            label: const Text('حذف القسم'),
          ),
        ),
      ],
    );
  }

  Widget _field({
    required String label,
    required String value,
    required ValueChanged<String> onChanged,
    bool multiline = false,
  }) {
    return LabeledField(
      label: label,
      child: CustomTextFormField(
        width: .infinity,
        initialValue: value,
        maxLines: multiline ? 4 : 1,
        onChanged: onChanged,
      ),
    );
  }
}
