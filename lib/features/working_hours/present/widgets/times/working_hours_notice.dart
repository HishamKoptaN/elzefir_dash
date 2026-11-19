import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';

/// شريط تنبيه داخلي: خطأ (أحمر) أو ملاحظة (محايد).
class WorkingHoursNotice extends StatelessWidget {
  const WorkingHoursNotice({
    super.key,
    required this.message,
    this.isError = false,
  });

  final String message;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final tint = isError ? scheme.error : scheme.primary;
    return Container(
      padding: .symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: tint.withValues(alpha: 0.07),
        borderRadius: .circular(12.r),
        border: Border.all(color: tint.withValues(alpha: 0.35)),
      ),
      child: Row(
        spacing: 8.w,
        children: [
          FaIcon(
            isError ? FontAwesomeIcons.circleExclamation : FontAwesomeIcons.circleInfo,
            size: 15.r,
            color: tint,
          ),
          Expanded(
            child: Text(
              message,
              style: context.textTheme.bodyMedium?.copyWith(color: tint),
            ),
          ),
        ],
      ),
    );
  }
}
