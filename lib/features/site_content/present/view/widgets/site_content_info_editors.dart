import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/site_content_controller.dart';
import 'info_sections_editor.dart';

/// محررا أقسام صفحتي الخصوصية والشروط.
class SiteContentInfoEditors extends StatelessWidget {
  const SiteContentInfoEditors({super.key, required this.controller});

  final SiteContentController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        InfoSectionsEditor(
          controller: controller,
          settingKey: 'privacy_sections_json',
          title: 'أقسام سياسة الخصوصية',
        ),
        InfoSectionsEditor(
          controller: controller,
          settingKey: 'terms_sections_json',
          title: 'أقسام الشروط والأحكام',
        ),
      ],
    );
  }
}
