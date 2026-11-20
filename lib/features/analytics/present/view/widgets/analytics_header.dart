import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/date_format_ext.dart';
import '../../../../../core/utils/extensions/theme_ext.dart';
import '../../../domain/entities/visitor_stats_entity.dart';

class AnalyticsHeader extends StatelessWidget {
  const AnalyticsHeader({
    super.key,
    required this.stats,
    required this.onRefresh,
  });

  final VisitorStatsEntity stats;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final last = stats.lastVisitAt;
    return Row(
      spacing: 12.w,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            spacing: 2.h,
            children: [
              Text('التحليلات', style: context.textTheme.headlineLarge),
              Text(
                last == null
                    ? 'إحصاءات زوار الموقع'
                    : 'آخر زيارة: ${last.shortArabic}',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
        IconButton.filledTonal(
          tooltip: 'تحديث',
          onPressed: onRefresh,
          icon: const FaIcon(FontAwesomeIcons.rotate, size: 18),
        ),
      ],
    );
  }
}
