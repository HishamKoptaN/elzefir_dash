import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return SectionCard(
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: 14.h,
        children: [
          SectionHeader(title: 'ساعات العمل', icon: FontAwesomeIcons.solidClock),
          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: WorkingTimeTile(
                  label: 'وقت الفتح',
                  value: formatClock(openMinutes),
                  icon: FontAwesomeIcons.solidSun,
                  onTap: onPickOpen,
                ),
              ),
              Expanded(
                child: WorkingTimeTile(
                  label: 'وقت الإغلاق',
                  value: formatClock(closeMinutes),
                  icon: FontAwesomeIcons.solidMoon,
                  onTap: onPickClose,
                ),
              ),
            ],
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
