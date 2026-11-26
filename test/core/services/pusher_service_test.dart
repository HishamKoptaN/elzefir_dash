import 'package:alzefr_dash/core/di/dio/api_module.dart';
import 'package:alzefr_dash/core/services/pusher_service.dart';
import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  PusherService buildService() {
    return PusherService(TokenStorage(), EventBus());
  }

  test('does not connect when the key is empty', () async {
    final service = buildService();
    addTearDown(service.dispose);

    await service.init(
      options: PusherChannelsOptions.fromCluster(
        scheme: 'wss',
        cluster: 'eu',
        key: '',
        port: 443,
      ),
    );
  });

  test('subscribing before init is a no-op', () async {
    final service = buildService();
    addTearDown(service.dispose);

    await service.subscribeUser(userId: '1');
  });
}
