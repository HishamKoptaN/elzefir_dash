import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/theme_ext.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final IconData? icon;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final style = OutlinedButton.styleFrom(
      foregroundColor: context.colorScheme.primary,
      minimumSize: Size(88.r, kMinInteractiveDimension),
      padding: .symmetric(horizontal: 16.r, vertical: 8.r),
      side: BorderSide(
        color: context.colorScheme.primary.withValues(alpha: 0.4),
      ),
      shape: RoundedRectangleBorder(borderRadius: .circular(10.r)),
      textStyle: context.textTheme.labelLarge,
    );
    if (icon != null) {
      return OutlinedButton.icon(
        onPressed: onTap,
        style: style,
        icon: Icon(icon, size: 18.r),
        label: Text(text),
      );
    }
    return OutlinedButton(onPressed: onTap, style: style, child: Text(text));
  }
}
