import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/widgets/forms/custom_text_form_field.dart';
import '../../../../../core/widgets/forms/form_section_card.dart';
import '../../../../../core/widgets/forms/labeled_field.dart';
import '../../../domain/fields/site_content_about_fields.dart';
import '../../../domain/fields/site_content_contact_fields.dart';
import '../../../domain/fields/site_content_fields.dart';
import '../../../domain/fields/site_content_info_fields.dart';
import '../../../domain/site_content_field.dart';
import '../../controller/site_content_controller.dart';
import 'site_content_info_editors.dart';

/// نموذج نصوص الموقع. الحقول تأتي من وصف واحد في طبقة النطاق، لذلك إضافة نص
/// جديد إلى الموقع لا تتطلب نسخ كود هنا.
class SiteContentForm extends StatelessWidget {
  const SiteContentForm({super.key, required this.controller});

  final SiteContentController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        _section(
          context: context,
          icon: Icons.auto_awesome_outlined,
          title: 'الواجهة الرئيسية',
          subtitle: 'العنوان والشعار ونصوص الأزرار كما تظهر للزبون',
          fields: SiteContentFields.hero,
        ),
        _section(
          context: context,
          icon: Icons.widgets_outlined,
          title: 'عناوين الأقسام',
          subtitle: 'النصوص الظاهرة فوق الأطباق والشريط المتحرك',
          fields: SiteContentFields.sections,
        ),
        _section(
          context: context,
          icon: Icons.info_outline_rounded,
          title: 'من نحن',
          subtitle: 'النبذة وميزات المطعم في الصفحة الرئيسية',
          fields: SiteAboutFields.fields,
        ),
        _section(
          context: context,
          icon: Icons.contact_support_outlined,
          title: 'بيانات التواصل',
          subtitle: 'الأرقام والروابط في التذييل وأزرار الاتصال',
          fields: SiteContactFields.fields,
        ),
        _section(
          context: context,
          icon: Icons.description_outlined,
          title: 'صفحات المعلومات',
          subtitle: 'عناوين ومقدمات من نحن والخصوصية والشروط واتصل بنا',
          fields: SiteInfoFields.fields,
        ),
        SiteContentInfoEditors(controller: controller),
      ],
    );
  }

  Widget _section({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required List<SiteContentField> fields,
  }) {
    return FormSectionCard(
      icon: icon,
      tint: context.colorScheme.primary,
      title: title,
      subtitle: subtitle,
      children: [
        for (final field in fields)
          LabeledField(
            label: field.label,
            child: CustomTextFormField(
              width: .infinity,
              initialValue: controller.valueOf(field.key),
              maxLines: field.multiline ? 3 : 1,
              onChanged: (value) {
                controller.setValue(field.key, value);
              },
            ),
          ),
      ],
    );
  }
}
