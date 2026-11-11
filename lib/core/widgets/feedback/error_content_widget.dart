import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/extensions/theme_ext.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final String? retryText;
  final IconData? icon;
  final double? iconSize;
  final bool showRetryButton;
  final Color? iconColor;
  final Color? textColor;
  final Color? buttonColor;
  final Color? buttonTextColor;

  const CustomErrorWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.retryText,
    this.icon,
    this.iconSize,
    this.showRetryButton = true,
    this.iconColor,
    this.textColor,
    this.buttonColor,
    this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: .all(24.r),
        child: Column(
          mainAxisSize: .min,
          spacing: 16.h,
          children: [
            Icon(
              icon ?? Icons.cloud_off_rounded,
              size: iconSize ?? 56.r,
              color: iconColor ?? context.colorScheme.error,
            ),
            Text(
              message,
              textAlign: .center,
              style: context.textTheme.titleMedium?.copyWith(
                color: textColor ?? context.colorScheme.onSurface,
              ),
            ),
            if (showRetryButton && onRetry != null)
              FilledButton.icon(
                onPressed: onRetry,
                style: buttonColor != null
                    ? FilledButton.styleFrom(
                        backgroundColor: buttonColor,
                        foregroundColor: buttonTextColor,
                      )
                    : null,
                icon: const Icon(Icons.refresh_rounded),
                label: Text(retryText ?? 'إعادة المحاولة'),
              ),
          ],
        ),
      ),
    );
  }
}