import 'package:alzefr_dash/features/analytics/domain/entities/visitor_entity.dart';
import 'package:alzefr_dash/features/analytics/domain/entities/visitor_stats_entity.dart';
import 'package:alzefr_dash/features/analytics/present/view/analytics_content.dart';
import 'package:flutter_test/flutter_test.dart';

import '../dashboard/dashboard_test_app.dart';

void main() {
  final stats = VisitorStatsEntity(
    totalVisits: 9,
    uniqueVisitors: 7,
    lastVisitAt: DateTime(2026, 11, 20, 12, 30),
    daily: <String, int>{'2026-11-19': 4, '2026-11-20': 5},
  );
  const visitors = <VisitorEntity>[
    VisitorEntity(id: 'v-1', visits: 3),
  ];

  testWidgets('renders KPIs, daily chart and top visitors', (tester) async {
    await pumpDashboard(
      tester,
      AnalyticsContent(
        stats: stats,
        visitors: visitors,
        onRefresh: () {},
      ),
    );

    expect(find.text('التحليلات'), findsOneWidget);
    expect(find.text('9'), findsWidgets);
    expect(find.text('7'), findsOneWidget);
    expect(find.text('الزيارات اليومية'), findsOneWidget);
    expect(find.text('أكثر الزوار زيارةً'), findsOneWidget);
    expect(find.text('v-1'), findsOneWidget);
    expect(find.text('3 زيارة'), findsOneWidget);
  });

  testWidgets('renders empty states for a fresh project', (tester) async {
    await pumpDashboard(
      tester,
      AnalyticsContent(
        stats: const VisitorStatsEntity(),
        visitors: const <VisitorEntity>[],
        onRefresh: () {},
      ),
    );

    expect(find.text('لا توجد زيارات مسجّلة بعد'), findsOneWidget);
    expect(find.text('لا توجد بيانات زوار بعد'), findsOneWidget);
  });
}
