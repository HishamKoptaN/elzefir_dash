import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../domain/working_hours.dart';
import '../common/section_card.dart';
import '../common/section_header.dart';

/// معاينة ملخص الإعدادات الحالية وحالتها المحفوظة.
class WorkingHoursPreviewCard extends StatelessWidget {
  const WorkingHoursPreviewCard({
    super.key,
    required this.current,
    required this.saved,
  });

  final WorkingHours current;
  final WorkingHours? saved;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: 10.h,
        children: [
          SectionHeader(
            title: 'المعاينة',
            icon: FontAwesomeIcons.eye,
            trailing: _StatusPill(isOpenNow: current.isOpenAt(DateTime.now())),
          ),
          Text(
            formatWorkingHoursSummary(current),
            style: context.textTheme.bodyLarge,
          ),
          if (saved != null)
            Text(
              'المحفوظ حاليًا: ${formatWorkingHoursSummary(saved!)}',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.isOpenNow});

  final bool isOpenNow;

  @override
  Widget build(BuildContext context) {
    final tint = isOpenNow
        ? context.colorScheme.primary
        : context.colorScheme.error;
    return Container(
      padding: .symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: tint.withValues(alpha: 0.1),
        borderRadius: .circular(20.r),
      ),
      child: Row(
        spacing: 6.w,
        children: [
          FaIcon(FontAwesomeIcons.solidCircle, size: 7.r, color: tint),
          Text(
            isOpenNow ? 'مفتوح الآن' : 'مغلق الآن',
            style: context.textTheme.labelMedium?.copyWith(color: tint),
          ),
        ],
      ),
    );
  }
}
