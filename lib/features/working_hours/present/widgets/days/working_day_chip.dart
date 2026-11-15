import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';

/// شريحة يوم واحد داخل بطاقة أيام العمل.
class WorkingDayChip extends StatelessWidget {
  const WorkingDayChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final BorderRadius radius = .circular(14.r);
    return Material(
      color: selected ? scheme.secondary : scheme.surfaceContainer,
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Container(
          padding: .symmetric(horizontal: 12.w, vertical: 14.h),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(
              color: selected
                  ? scheme.primary.withValues(alpha: 0.25)
                  : scheme.outlineVariant.withValues(alpha: 0.7),
            ),
          ),
          child: Row(
            spacing: 8.w,
            children: [
              FaIcon(
                selected ? FontAwesomeIcons.solidCircleCheck : FontAwesomeIcons.circle,
                size: 16.r,
                color: selected
                    ? scheme.primary
                    : scheme.onSurface.withValues(alpha: 0.35),
              ),
              Expanded(
                child: Text(
                  label,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: selected ? scheme.primary : scheme.onSurface,
                    fontWeight: selected ? .bold : .normal,
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
