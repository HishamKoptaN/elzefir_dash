import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.width,
    this.height = 73,
    this.backgroundColor,
    this.borderColor,
    this.titleStyle,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.padding,
    this.alignment = Alignment.center,
  });

  final String title;
  final double? width;
  final double height;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? titleStyle;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1400.w,
      height: height.h,
      padding: padding,
      decoration: BoxDecoration(
        // color: backgroundColor ?? AppColors.primaryLight,
        border: Border.all(
          color: borderColor ?? const Color(0xFFD9D9D9).withValues(alpha: 0.44),
        ),
      ),
      child: alignment == Alignment.center
          ? _buildCenteredContent()
          : _buildPaddedContent(),
    );
  }

  Widget _buildCenteredContent() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5.w,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: iconColor ?? Colors.white,
              size: iconSize?.w ?? 24.w,
            ),
          ],
          Text(
            title,
            style:
                titleStyle ??
                TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  // color: AppColors.primary,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaddedContent() {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        spacing: 5.w,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: iconColor ?? Colors.white,
              size: iconSize?.w ?? 24.w,
            ),
          ],
          Text(
            title,
            style:
                titleStyle ??
                TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
