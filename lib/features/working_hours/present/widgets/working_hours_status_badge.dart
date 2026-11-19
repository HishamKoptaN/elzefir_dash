import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/theme_ext.dart';
import '../../data/working_hours_data_src.dart';
import '../../domain/working_hours.dart';

/// شارة تُظهر حالة المطعم الآن (مفتوح/مغلق) اعتمادًا على ساعات العمل المحفوظة،
/// وتُحدّث نفسها تلقائيًا كل دقيقة.
class WorkingHoursStatusBadge extends StatefulWidget {
  const WorkingHoursStatusBadge({super.key});

  @override
  State<WorkingHoursStatusBadge> createState() {
    return _WorkingHoursStatusBadgeState();
  }
}

class _WorkingHoursStatusBadgeState extends State<WorkingHoursStatusBadge> {
  final WorkingHoursDataSrc _dataSrc = WorkingHoursDataSrc();
  Timer? _ticker;
  WorkingHours? _hours;
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    _load();
    _ticker = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final saved = await _dataSrc.get();
      if (!mounted) return;
      setState(() {
        _hours = saved ?? WorkingHours.defaults;
        _failed = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _failed = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hours = _hours;
    // لا نعرض حالة مضللة قبل قراءة الإعدادات.
    if (hours == null) {
      return _failed
          ? _BadgePill(
              label: 'تعذّر تحميل حالة العمل',
              color: context.colorScheme.onSurface.withValues(alpha: 0.6),
            )
          : const SizedBox.shrink();
    }
    final isOpen = hours.isOpenAt(DateTime.now());
    return _BadgePill(
      label: isOpen ? 'مفتوح الآن' : 'مغلق الآن',
      color: isOpen ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
    );
  }
}

class _BadgePill extends StatelessWidget {
  const _BadgePill({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: color.withValues(alpha: 0.45)),
      ),
      child: Row(
        mainAxisSize: .min,
        spacing: 8.w,
        children: [
          Container(
            width: 10.r,
            height: 10.r,
            decoration: BoxDecoration(color: color, shape: .circle),
          ),
          Text(
            label,
            style: context.textTheme.labelLarge?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
