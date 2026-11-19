import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/theme_ext.dart';
import '../../data/working_hours_data_src.dart';
import '../../domain/working_hours.dart';

/// يعرض أيام وساعات العمل المحفوظة في الفوتر، ويرجع للقيم الافتراضية عند
/// تعذّر القراءة حتى لا يتعطّل عرض الصفحة.
class WorkingHoursDisplay extends StatefulWidget {
  const WorkingHoursDisplay({super.key, required this.compact});

  /// نسخة سطر واحد للشاشات الصغيرة.
  final bool compact;

  @override
  State<WorkingHoursDisplay> createState() => _WorkingHoursDisplayState();
}

class _WorkingHoursDisplayState extends State<WorkingHoursDisplay> {
  final WorkingHoursDataSrc _dataSrc = WorkingHoursDataSrc();
  WorkingHours _hours = WorkingHours.defaults;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final saved = await _dataSrc.get();
      if (!mounted || saved == null) return;
      setState(() => _hours = saved);
    } catch (_) {
      // القيم الافتراضية كافية هنا؛ لا نعرض خطأً في صفحة المطعم.
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeRange =
        '${formatClock(_hours.openMinutes)} - ${formatClock(_hours.closeMinutes)}';
    final days = formatWorkingDays(_hours.days);
    if (widget.compact) {
      return Text(
        '$days: $timeRange',
        style: context.textTheme.bodyLarge?.copyWith(color: Colors.white70),
      );
    }
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.access_time,
              color: Color(0xFFFACC15),
              size: 16,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                days,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Padding(
          padding: EdgeInsets.only(right: 24.w),
          child: Text(
            timeRange,
            style: TextStyle(color: Colors.white70, fontSize: 18.sp),
          ),
        ),
      ],
    );
  }
}
