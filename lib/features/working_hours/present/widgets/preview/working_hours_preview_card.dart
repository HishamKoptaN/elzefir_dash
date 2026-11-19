import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../domain/working_hours.dart';
import '../common/section_card.dart';
import '../common/section_header.dart';

/// معاينة ملخص الإعدادات الحالية كما ستراها صفحة المطعم للزبون.
class WorkingHoursPreviewCard extends StatelessWidget {
  const WorkingHoursPreviewCard({
    super.key,
    required this.current,
    required this.saved,
  });

  final WorkingHours current;
  final WorkingHours? saved;

  static Set<int> _offDays(Set<int> days) {
    return weekdayNames.keys.toSet().difference(days);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final isOpenNow = current.isOpenAt(DateTime.now());
    return SectionCard(
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: 12.h,
        children: [
          SectionHeader(
            title: 'المعاينة المباشرة للمطعم',
            icon: FontAwesomeIcons.eye,
            trailing: Container(
              padding: .symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: scheme.surfaceContainerHigh,
                borderRadius: .circular(8.r),
              ),
              child: Text(
                'عرض الزبون',
                style: context.textTheme.labelMedium?.copyWith(
                  color: scheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ),
          ),
          Container(
            padding: .all(12.r),
            decoration: BoxDecoration(
              color: scheme.surfaceContainerLow,
              borderRadius: .circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: .start,
              spacing: 10.h,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10.r,
                      height: 10.r,
                      decoration: BoxDecoration(
                        color: isOpenNow ? scheme.secondary : scheme.error,
                        shape: .circle,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        isOpenNow
                            ? 'مفتوح الآن لاستقبال الطلبات'
                            : 'مغلق الآن',
                        style: context.textTheme.labelLarge?.copyWith(
                          color: isOpenNow ? scheme.secondary : scheme.error,
                        ),
                      ),
                    ),
                    Text(
                      isOpenNow
                          ? 'يغلق ${formatClock(current.closeMinutes)}'
                          : 'يفتح ${formatClock(current.openMinutes)}',
                      style: context.textTheme.labelMedium?.copyWith(
                        color: scheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
                Divider(height: 1, color: scheme.outline),
                _PreviewRow(
                  label: 'أيام الاستقبال:',
                  value: formatWorkingDays(current.days),
                  valueColor: scheme.primary,
                ),
                _PreviewRow(
                  label: 'ساعات الاستقبال:',
                  value:
                      '${formatClock(current.openMinutes)} - ${formatClock(current.closeMinutes)}',
                  valueColor: scheme.secondary,
                ),
                _PreviewRow(
                  label: 'أيام العطلة:',
                  value: formatWorkingDays(_offDays(current.days)),
                ),
              ],
            ),
          ),
          if (saved != null)
            Text(
              'المحفوظ حاليًا: ${formatWorkingHoursSummary(saved!)}',
              style: context.textTheme.bodySmall?.copyWith(
                color: scheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
        ],
      ),
    );
  }
}

class _PreviewRow extends StatelessWidget {
  const _PreviewRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    return Row(
      children: [
        Text(
          label,
          style: context.textTheme.bodyMedium?.copyWith(
            color: scheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        const Spacer(),
        Flexible(
          child: Text(
            value,
            maxLines: 1,
            overflow: .ellipsis,
            textAlign: .left,
            style: context.textTheme.bodyMedium?.copyWith(
              color: valueColor ?? scheme.onSurface,
              fontWeight: valueColor != null ? .bold : .normal,
            ),
          ),
        ),
      ],
    );
  }
}
