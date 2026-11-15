import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';

/// ترويسة قسم: أيقونة + عنوان، مع عنصر اختياري في الطرف المقابل.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.icon,
    this.trailing,
  });

  final String title;
  final FaIconData icon;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(icon, size: 16.r, color: context.colorScheme.primary),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(title, style: context.textTheme.titleMedium),
        ),
        ?trailing,
      ],
    );
  }
}
