// lib/core/events/pusher_event_bus.dart
import 'package:event_bus/event_bus.dart';
import 'package:injectable/injectable.dart';

@singleton
class PusherEventBus {
  final EventBus _eventBus = EventBus();
  void fire(dynamic event) {
    _eventBus.fire(event);
  }

  Stream<T> on<T>() {
    return _eventBus.on<T>();
  }
}
