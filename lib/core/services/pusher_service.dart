import 'dart:async';
import 'dart:developer';
import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:event_bus/event_bus.dart';
import 'package:injectable/injectable.dart';
import '../../config/env_config.dart';
import '../di/dio/api_module.dart';

@singleton
class PusherService {
  PusherChannelsClient? _client;
  final TokenStorage _tokenStorage;
  final EventBus eventBus;
  PusherService(this._tokenStorage, this.eventBus);
  final StreamController<String> statusController =
      StreamController<String>.broadcast();
  void init() async {
    try {
      PusherChannelsPackageLogger.enableLogs();
      _client = PusherChannelsClient.websocket(
        options: EnvConfig.config.pusherChannelsOptions,
        connectionErrorHandler: (exception, trace, refresh) async {
          log(exception.toString(), name: 'Pusher Connection Error');
          refresh();
        },
      );
      _client!.connect();
    } catch (e) {
      log('Error Pusher: $e');
    }
  }

  StreamSubscription? _userChannelSubs;
  void subscribeUser({required String userId}) async {
    try {
      _userChannelSubs?.cancel();
      final token = await _tokenStorage.getToken();
      final channel = _client!.privateChannel(
        'private-user.$userId',
        authorizationDelegate:
            EndpointAuthorizableChannelTokenAuthorizationDelegate.forPrivateChannel(
              authorizationEndpoint: Uri.parse(
                'https://hotpink-gnu-383634.hostingersite.com/api/auth/broadcasting/auth',
              ),
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
                'Content-Type': 'application/x-www-form-urlencoded',
              },
            ),
      );
      channel.subscribe();
      _userChannelSubs = channel.bind('user-role-updated').listen((event) {
        log('${event.data}');
        eventBus.fire(event);
      });
    } catch (e) {
      log('Error: $e');
    }
  }
}
