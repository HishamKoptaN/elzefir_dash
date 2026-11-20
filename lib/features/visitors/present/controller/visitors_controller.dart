import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../data/visitors_data_src.dart';
import '../../domain/visitor_stats.dart';

/// يدير الاشتراك المباشر في إحصاءات الزوار ويكشف حالتها للواجهة.
class VisitorsController extends ChangeNotifier {
  VisitorsController({VisitorsDataSrc? dataSrc})
    : _dataSrc = dataSrc ?? VisitorsDataSrc() {
    _subscribe();
  }

  final VisitorsDataSrc _dataSrc;
  StreamSubscription<VisitorStats>? _subscription;
  bool _disposed = false;
  bool _loading = true;
  Object? _loadError;
  VisitorStats _stats = VisitorStats.empty;

  bool get isLoading => _loading;
  Object? get loadError => _loadError;
  VisitorStats get stats => _stats;

  void _subscribe() {
    _subscription = _dataSrc.watch().listen(
      (stats) {
        _stats = stats;
        _loading = false;
        _notify();
      },
      onError: (Object error) {
        _loadError = error;
        _loading = false;
        _notify();
      },
    );
  }

  void _notify() {
    if (_disposed) {
      return;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    _subscription?.cancel();
    super.dispose();
  }
}
