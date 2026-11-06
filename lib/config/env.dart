import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:firebase_core/firebase_core.dart';
import 'env_config.dart';

abstract class Env {
  DataSrcMode get dataSourceMode;
  FirebaseOptions get firebaseOptions;
  String get baseUrl;
  String get authBaseUrl;
  String get vapidKey;
  String get dashboardUrl;
  bool get enableLogging;
  PusherChannelsOptions get pusherChannelsOptions;
}
