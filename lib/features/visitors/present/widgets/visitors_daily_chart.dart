import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/theme_ext.dart';

/// رسم أعمدة بسيط لآخر 7 أيام دون أي حزمة رسوم إضافية.
class VisitorsDailyChart extends StatelessWidget {
  const VisitorsDailyChart({super.key, required this.daily});

  final List<MapEntry<String, int>> daily;

  @override
  Widget build(BuildContext context) {
    if (daily.isEmpty) {
      return Padding(
        padding: .symmetric(vertical: 24.h),
        child: Center(
          child: Text(
            'لا توجد زيارات مسجلة بعد',
            style: context.textTheme.bodyMedium,
          ),
        ),
      );
    }
    final peak = daily
        .map((entry) {
          return entry.value;
        })
        .reduce((a, b) {
          return a > b ? a : b;
        });
    final safePeak = peak == 0 ? 1 : peak;
    return SizedBox(
      height: 160.h,
      child: Row(
        crossAxisAlignment: .end,
        children: [
          for (final entry in daily)
            Expanded(
              child: Padding(
                padding: .symmetric(horizontal: 3.w),
                child: Column(
                  mainAxisAlignment: .end,
                  children: [
                    Text('${entry.value}', style: context.textTheme.labelSmall),
                    SizedBox(height: 4.h),
                    Container(
                      height: (entry.value / safePeak * 90).h,
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary.withValues(
                          alpha: 0.75,
                        ),
                        borderRadius: .circular(6.r),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      entry.key.substring(5),
                      style: context.textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
