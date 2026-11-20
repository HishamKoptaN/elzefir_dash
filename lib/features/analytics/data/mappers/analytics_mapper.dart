import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/visitor_entity.dart';
import '../../domain/entities/visitor_stats_entity.dart';

VisitorStatsEntity mapVisitorStats(Map<String, dynamic> json) {
  return VisitorStatsEntity(
    totalVisits: _int(json['totalVisits']),
    uniqueVisitors: _int(json['uniqueVisitors']),
    lastVisitAt: _date(json['lastVisitAt']),
    daily: _daily(json['daily']),
  );
}

VisitorEntity mapVisitor(Map<String, dynamic> json) {
  return VisitorEntity(
    id: '${json['id'] ?? ''}',
    visits: _int(json['visits']),
    firstSeenAt: _date(json['firstSeenAt']),
    lastSeenAt: _date(json['lastSeenAt']),
  );
}

int _int(Object? value) {
  if (value is num) {
    return value.toInt();
  }
  return 0;
}

DateTime? _date(Object? value) {
  if (value is Timestamp) {
    return value.toDate();
  }
  if (value is DateTime) {
    return value;
  }
  return null;
}

Map<String, int> _daily(Object? value) {
  if (value is! Map) {
    return <String, int>{};
  }
  return value.map<String, int>((key, val) {
    return MapEntry<String, int>('$key', _int(val));
  });
}
