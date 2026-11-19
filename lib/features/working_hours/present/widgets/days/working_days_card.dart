import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../domain/working_hours.dart';
import '../common/section_card.dart';
import '../common/section_header.dart';
import 'select_all_days_button.dart';
import 'working_day_row.dart';

/// بطاقة اختيار أيام العمل بأسلوب Stitch: صفوف أيام مع شارة حالة،
/// وسطر ملخص بالأيام المحددة.
class WorkingDaysCard extends StatelessWidget {
  const WorkingDaysCard({
    super.key,
    required this.days,
    required this.allDaysSelected,
    required this.onToggleDay,
    required this.onToggleAllDays,
  });

  final Set<int> days;
  final bool allDaysSelected;
  final ValueChanged<int> onToggleDay;
  final VoidCallback onToggleAllDays;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: 12.h,
        children: [
          SectionHeader(
            title: 'أيام العمل',
            subtitle: 'اختر أيام استقبال الطلبات',
            icon: FontAwesomeIcons.calendarDays,
            trailing: SelectAllDaysButton(
              allSelected: allDaysSelected,
              onPressed: onToggleAllDays,
            ),
          ),
          for (final entry in weekdayNames.entries)
            WorkingDayRow(
              label: entry.value,
              selected: days.contains(entry.key),
              onTap: () {
                onToggleDay(entry.key);
              },
            ),
          _SummaryLine(days: days),
        ],
      ),
    );
  }
}

class _SummaryLine extends StatelessWidget {
  const _SummaryLine({required this.days});

  final Set<int> days;

  @override
  Widget build(BuildContext context) {
    final isEmpty = days.isEmpty;
    final text = isEmpty
        ? 'لم يتم تحديد أي يوم عمل (المطعم مغلق مؤقتاً)'
        : 'الأيام المحددة: ${formatWorkingDays(days)} (${days.length} ${days.length == 1 ? 'يوم' : 'أيام'} أسبوعياً)';
    return Container(
      padding: .symmetric(horizontal: 12.r, vertical: 10.r),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        borderRadius: .circular(12.r),
      ),
      child: Row(
        spacing: 8.w,
        children: [
          FaIcon(
            isEmpty ? FontAwesomeIcons.triangleExclamation : FontAwesomeIcons.circleInfo,
            size: 14.r,
            color: isEmpty
                ? context.colorScheme.error
                : context.colorScheme.secondary,
          ),
          Expanded(
            child: Text(
              text,
              style: context.textTheme.bodyMedium?.copyWith(
                color: isEmpty
                    ? context.colorScheme.error
                    : context.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
