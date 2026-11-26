import 'package:alzefr_dash/features/analytics/data/mappers/analytics_mapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('analytics mapper', () {
    test('يقرأ إحصاءات الزوار مع الطوابع الزمنية والتوزيع اليومي', () {
      final visitedAt = Timestamp.fromDate(DateTime(2026, 11, 20, 12));

      final result = mapVisitorStats({
        'totalVisits': 42.7,
        'uniqueVisitors': 9,
        'lastVisitAt': visitedAt,
        'daily': {'2026-11-20': 7, '2026-11-21': 3, '2026-11-22': 'غير رقم'},
      });

      expect(result.totalVisits, 42);
      expect(result.uniqueVisitors, 9);
      expect(result.lastVisitAt, visitedAt.toDate());
      expect(result.daily, {
        '2026-11-20': 7,
        '2026-11-21': 3,
        '2026-11-22': 0,
      });
    });

    test('يتجاهل القيم المفقودة أو غير الصحيحة', () {
      final result = mapVisitorStats({'daily': 'not-a-map', 'totalVisits': null});

      expect(result.totalVisits, 0);
      expect(result.uniqueVisitors, 0);
      expect(result.lastVisitAt, isNull);
      expect(result.daily, isEmpty);
    });

    test('يقبل التاريخ المباشر في حقول الزائر ويحول المعرّف إلى نص', () {
      final first = DateTime(2026, 11, 1);
      final last = Timestamp.fromDate(DateTime(2026, 11, 20));

      final result = mapVisitor({
        'id': 17,
        'visits': 5,
        'firstSeenAt': first,
        'lastSeenAt': last,
      });

      expect(result.id, '17');
      expect(result.visits, 5);
      expect(result.firstSeenAt, first);
      expect(result.lastSeenAt, last.toDate());
    });
  });
}
