import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/extensions/theme_ext.dart';

/// بطاقة قسم نموذج بأسلوب Stitch: أيقونة في مربع ملون + عنوان ووصف،
/// وخلفية بيضاء بحدود خفيفة تحوي حقول القسم.
class FormSectionCard extends StatelessWidget {
  const FormSectionCard({
    super.key,
    required this.icon,
    required this.tint,
    required this.title,
    required this.subtitle,
    required this.children,
  });

  final IconData icon;
  final Color tint;
  final String title;
  final String subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .infinity,
      padding: .all(16.r),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: .circular(16.r),
        border: Border.all(color: context.colorScheme.outline),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withValues(alpha: 0.05),
            offset: const Offset(0, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 16.h,
        children: [
          Row(
            children: [
              Container(
                width: 36.r,
                height: 36.r,
                decoration: BoxDecoration(
                  color: tint.withValues(alpha: 0.12),
                  borderRadius: .circular(10.r),
                ),
                child: Icon(icon, size: 20.r, color: tint),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 2.h,
                  children: [
                    Text(title, style: context.textTheme.titleMedium),
                    Text(
                      subtitle,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurface.withValues(
                          alpha: 0.55,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ...children,
        ],
      ),
    );
  }
}
