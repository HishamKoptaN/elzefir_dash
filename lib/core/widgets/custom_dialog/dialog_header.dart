import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../theme/app_colors.dart';
import '../../utils/extensions/responsive_icon_extension .dart';

class DialogHeader extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool showExitIcon;
  const DialogHeader({
    super.key,
    required this.title,
    this.icon,
    this.showExitIcon = true,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: LightColors().primary,
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withValues(alpha: 0.3),
            width: 1.h,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon),
          Gap(10.w),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          if (showExitIcon)
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(color: const Color(0xFF313131)),
                child: Icon(Icons.close, size: 20.iconRes, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
