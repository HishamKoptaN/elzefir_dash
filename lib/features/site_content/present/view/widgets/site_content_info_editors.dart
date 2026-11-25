import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/site_content_controller.dart';
import 'about_features_editor.dart';
import 'addons_editor.dart';
import 'cooking_methods_editor.dart';
import 'gallery_items_editor.dart';
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
        InfoSectionsEditor(
          controller: controller,
          settingKey: 'about_sections_json',
          title: 'أقسام صفحة من نحن',
        ),
        AboutFeaturesEditor(controller: controller),
        GalleryItemsEditor(controller: controller),
        CookingMethodsEditor(controller: controller),
        AddonsEditor(controller: controller),
      ],
    );
  }
}
