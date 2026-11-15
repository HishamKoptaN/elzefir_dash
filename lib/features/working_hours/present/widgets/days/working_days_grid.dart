import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/working_hours.dart';
import 'working_day_chip.dart';

/// شبكة شرائح الأيام، تتبدّل أعمدةها حسب عرض الشاشة.
class WorkingDaysGrid extends StatelessWidget {
  const WorkingDaysGrid({
    super.key,
    required this.days,
    required this.onToggleDay,
  });

  final Set<int> days;
  final ValueChanged<int> onToggleDay;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = switch (constraints.maxWidth) {
          >= 1024 => weekdayNames.length,
          >= 600 => 4,
          _ => 2,
        };
        final spacing = 10.w;
        final itemWidth =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: 10.h,
          children: [
            for (final entry in weekdayNames.entries)
              SizedBox(
                width: itemWidth,
                child: WorkingDayChip(
                  label: entry.value,
                  selected: days.contains(entry.key),
                  onTap: () {
                    onToggleDay(entry.key);
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
