import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';

/// زر تحديد/إلغاء تحديد كل أيام الأسبوع.
class SelectAllDaysButton extends StatelessWidget {
  const SelectAllDaysButton({
    super.key,
    required this.allSelected,
    required this.onPressed,
  });

  final bool allSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = .circular(12.r);
    return Material(
      color: context.colorScheme.onSurface.withValues(alpha: 0.06),
      borderRadius: radius,
      child: InkWell(
        onTap: onPressed,
        borderRadius: radius,
        child: Padding(
          padding: .symmetric(horizontal: 10.w, vertical: 8.h),
          child: Row(
            spacing: 6.w,
            children: [
              FaIcon(
                allSelected ? FontAwesomeIcons.solidSquareCheck : FontAwesomeIcons.tableCellsLarge,
                size: 14.r,
                color: context.colorScheme.primary,
              ),
              Flexible(
                child: Text(
                  allSelected ? 'إلغاء تحديد الكل' : 'تحديد كل الأيام',
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
