import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/extensions/theme_ext.dart';

class EmptyWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? hint;
  final String? actionText;
  final VoidCallback? onAction;

  const EmptyWidget({
    super.key,
    required this.icon,
    required this.text,
    this.hint,
    this.actionText,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: .all(24.r),
        child: Column(
          mainAxisSize: .min,
          spacing: 12.h,
          children: [
            Container(
              padding: .all(20.r),
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withValues(alpha: 0.08),
                shape: .circle,
              ),
              child: Icon(
                icon,
                size: 40.r,
                color: context.colorScheme.primary.withValues(alpha: 0.6),
              ),
            ),
            Text(
              text,
              textAlign: .center,
              style: context.textTheme.titleLarge,
            ),
            if (hint != null)
              Text(
                hint!,
                textAlign: .center,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            if (actionText != null && onAction != null)
              FilledButton.icon(
                onPressed: onAction,
                icon: const Icon(Icons.add),
                label: Text(actionText!),
              ),
          ],
        ),
      ),
    );
  }
}