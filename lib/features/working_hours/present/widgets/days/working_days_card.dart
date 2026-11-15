import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../domain/working_hours.dart';
import '../common/section_card.dart';
import '../common/section_header.dart';
import 'select_all_days_button.dart';
import 'working_days_grid.dart';

/// بطاقة اختيار أيام العمل.
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
        spacing: 14.h,
        children: [
          SectionHeader(
            title: 'أيام العمل',
            icon: FontAwesomeIcons.calendarDays,
            trailing: SelectAllDaysButton(
              allSelected: allDaysSelected,
              onPressed: onToggleAllDays,
            ),
          ),
          WorkingDaysGrid(days: days, onToggleDay: onToggleDay),
          Divider(
            height: 1,
            color: context.colorScheme.outlineVariant.withValues(alpha: 0.4),
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
    final text = days.isEmpty
        ? 'لم يتم تحديد أي يوم عمل'
        : 'الأيام المحددة: ${formatWorkingDays(days)}';
    return Row(
      spacing: 8.w,
      children: [
        FaIcon(
          FontAwesomeIcons.circleInfo,
          size: 14.r,
          color: context.colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: 0.65),
            ),
          ),
        ),
      ],
    );
  }
}
