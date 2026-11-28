import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// سطر شرط من شروط كلمة المرور، بألوان مأخوذة من الثيم.
class PasswordRequirementTile extends StatelessWidget {
  const PasswordRequirementTile({
    super.key,
    required this.text,
    required this.isSatisfied,
  });

  final String text;
  final bool isSatisfied;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 4.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              color: isSatisfied
                  ? colorScheme.primary
                  : colorScheme.onSurfaceVariant,
              fontWeight: isSatisfied ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
