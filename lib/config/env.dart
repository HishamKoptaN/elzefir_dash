import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class Env {
  FirebaseOptions get firebaseOptions;
  String get baseUrl;
  String get authBaseUrl;
  String get vapidKey;
  String get dashboardUrl;
  bool get enableLogging;
  PusherChannelsOptions get pusherChannelsOptions;
}
