import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';

/// صف يوم واحد بأسلوب Stitch: دائرة حالة + اسم اليوم + شارة «يوم عمل»
/// أو «عطلة أسبوعية»، والنقر يبدّل التحديد.
class WorkingDayRow extends StatelessWidget {
  const WorkingDayRow({
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
    final radius = BorderRadius.circular(14.r);
    return Material(
      color: selected ? scheme.primary : scheme.surfaceContainerLow,
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Container(
          constraints: const BoxConstraints(
            minHeight: kMinInteractiveDimension,
          ),
          padding: .symmetric(horizontal: 12.r, vertical: 10.r),
          child: Row(
            children: [
              Container(
                width: 24.r,
                height: 24.r,
                decoration: BoxDecoration(
                  color: selected ? scheme.secondary : scheme.surfaceContainerHighest,
                  shape: .circle,
                ),
                child: Icon(
                  selected ? Icons.check_rounded : Icons.close_rounded,
                  size: 16.r,
                  color: selected ? scheme.onSecondary : scheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 2.h,
                  children: [
                    Text(
                      label,
                      maxLines: 1,
                      overflow: .ellipsis,
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: .w600,
                        color: selected
                            ? scheme.onPrimary
                            : scheme.onSurface.withValues(alpha: 0.85),
                      ),
                    ),
                    Text(
                      selected ? 'يوم عمل' : 'عطلة أسبوعية',
                      maxLines: 1,
                      overflow: .ellipsis,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: selected
                            ? scheme.onPrimary.withValues(alpha: 0.85)
                            : scheme.onSurface.withValues(alpha: 0.55),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
