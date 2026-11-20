import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../../../core/widgets/feedback/empty_widget.dart';
import '../../../domain/entities/daily_visits_entity.dart';

class DailyVisitsChart extends StatelessWidget {
  const DailyVisitsChart({super.key, required this.days});

  final List<DailyVisitsEntity> days;

  @override
  Widget build(BuildContext context) {
    final items = days.length > 7 ? days.sublist(days.length - 7) : days;
    if (items.isEmpty) {
      return const EmptyWidget(
        icon: Icons.bar_chart_rounded,
        text: 'لا توجد زيارات مسجّلة بعد',
      );
    }
    final max = items.fold<int>(0, (current, day) {
      return day.visits > current ? day.visits : current;
    });
    return Card(
      child: Padding(
        padding: .all(16.r),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 12.h,
          children: [
            Text('الزيارات اليومية', style: context.textTheme.titleLarge),
            SizedBox(
              height: 170.h,
              child: Row(
                crossAxisAlignment: .end,
                spacing: 8.w,
                children: [
                  for (final day in items)
                    Expanded(
                      child: _VisitBar(
                        day: day,
                        ratio: max == 0 ? 0 : day.visits / max,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VisitBar extends StatelessWidget {
  const _VisitBar({required this.day, required this.ratio});

  final DailyVisitsEntity day;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .end,
      children: [
        Text('${day.visits}', style: context.textTheme.labelSmall),
        SizedBox(height: 4.h),
        Container(
          height: 100.h * ratio,
          decoration: BoxDecoration(
            color: context.colorScheme.primary,
            borderRadius: .circular(6.r),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          day.day.length > 5 ? day.day.substring(5) : day.day,
          style: context.textTheme.labelSmall,
          maxLines: 1,
          overflow: .ellipsis,
        ),
      ],
    );
  }
}
