import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../domain/entities/daily_visits_entity.dart';
import '../../domain/entities/visitor_entity.dart';
import '../../domain/entities/visitor_stats_entity.dart';
import 'widgets/analytics_header.dart';
import 'widgets/analytics_kpi_card.dart';
import 'widgets/daily_visits_chart.dart';
import 'widgets/top_visitors_card.dart';

class AnalyticsContent extends StatelessWidget {
  const AnalyticsContent({
    super.key,
    required this.stats,
    required this.visitors,
    required this.onRefresh,
  });

  final VisitorStatsEntity stats;
  final List<VisitorEntity> visitors;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final columns = width >= 900 ? 4 : width >= 600 ? 2 : 1;
        return SingleChildScrollView(
          padding: .all(16.r),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: .stretch,
                spacing: 16.h,
                children: [
                  AnalyticsHeader(stats: stats, onRefresh: onRefresh),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: columns,
                    mainAxisSpacing: 12.h,
                    crossAxisSpacing: 12.w,
                    childAspectRatio: 1.6,
                    children: [
                      AnalyticsKpiCard(
                        label: 'إجمالي الزيارات',
                        value: '${stats.totalVisits}',
                        icon: FontAwesomeIcons.eye,
                      ),
                      AnalyticsKpiCard(
                        label: 'الزوار الفريدون',
                        value: '${stats.uniqueVisitors}',
                        icon: FontAwesomeIcons.users,
                      ),
                      AnalyticsKpiCard(
                        label: 'زيارات اليوم',
                        value: '${stats.todayVisits}',
                        icon: FontAwesomeIcons.calendarDay,
                      ),
                      AnalyticsKpiCard(
                        label: 'متوسط الزيارات يومياً',
                        value: stats.averageVisits.toStringAsFixed(1),
                        icon: FontAwesomeIcons.chartLine,
                      ),
                    ],
                  ),
                  DailyVisitsChart(days: stats.sortedDaily),
                  TopVisitorsCard(visitors: visitors),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
