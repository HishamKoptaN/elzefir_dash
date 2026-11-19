import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../domain/working_hours.dart';
import '../common/section_card.dart';
import '../common/section_header.dart';
import 'working_hours_notice.dart';
import 'working_time_tile.dart';

/// بطاقة وقت الفتح والإغلاق مع التنبيهات المرتبطة بهما.
class WorkingTimesCard extends StatelessWidget {
  const WorkingTimesCard({
    super.key,
    required this.openMinutes,
    required this.closeMinutes,
    required this.onPickOpen,
    required this.onPickClose,
  });

  final int openMinutes;
  final int closeMinutes;
  final VoidCallback onPickOpen;
  final VoidCallback onPickClose;

  @override
  Widget build(BuildContext context) {
    final open = clockParts12(openMinutes);
    final close = clockParts12(closeMinutes);
    final scheme = context.colorScheme;
    return SectionCard(
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: 14.h,
        children: [
          SectionHeader(
            title: 'مواعيد الدوام اليومي',
            subtitle: 'فترة العمل الرسمية للطلبات',
            icon: FontAwesomeIcons.solidClock,
            tint: scheme.secondary,
          ),
          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: WorkingTimeTile(
                  label: 'وقت الفتح',
                  value: open.time,
                  suffix: open.suffix,
                  icon: FontAwesomeIcons.solidSun,
                  tint: scheme.tertiary,
                  onTap: onPickOpen,
                ),
              ),
              Expanded(
                child: WorkingTimeTile(
                  label: 'وقت الإغلاق',
                  value: close.time,
                  suffix: close.suffix,
                  icon: FontAwesomeIcons.solidMoon,
                  tint: scheme.primary,
                  onTap: onPickClose,
                ),
              ),
            ],
          ),
          Container(
            padding: .symmetric(horizontal: 12.r, vertical: 10.r),
            decoration: BoxDecoration(
              color: scheme.secondary.withValues(alpha: 0.12),
              borderRadius: .circular(12.r),
            ),
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.hourglassHalf,
                  size: 16.r,
                  color: scheme.secondary,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    'إجمالي ساعات العمل اليومية',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: scheme.onSurface.withValues(alpha: 0.75),
                    ),
                  ),
                ),
                Text(
                  formatWorkingHoursDuration(openMinutes, closeMinutes),
                  style: context.textTheme.titleMedium?.copyWith(
                    color: scheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          ..._buildNotices(),
        ],
      ),
    );
  }

  List<Widget> _buildNotices() {
    if (openMinutes == closeMinutes) {
      return const [
        WorkingHoursNotice(
          isError: true,
          message: 'وقت الفتح ووقت الإغلاق متطابقان، اختر وقتًا مختلفًا.',
        ),
      ];
    }
    if (openMinutes > closeMinutes) {
      return const [
        WorkingHoursNotice(
          message: 'وقت الإغلاق قبل وقت الفتح، لذا سيُحسب الإغلاق في اليوم التالي.',
        ),
      ];
    }
    return const [];
  }
}
