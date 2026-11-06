import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import '../env.dart';
import '../env_config.dart';
import '../firebase/firebase_options_dev.dart';

class LocalEnv extends Env {
  @override
  DataSrcMode get dataSourceMode {
    return .api;
  }

  @override
  bool get enableLogging {
    return true;
  }

  @override
  FirebaseOptions get firebaseOptions {
    return DevFirebaseOptions.currentPlatform;
  }

  @override
  String get baseUrl {
    return 'http://192.168.0.153:8000/api/admin/';
  }

  @override
  String get authBaseUrl {
    return 'http://192.168.0.153:8000/api/auth/';
  }

  @override
  String get vapidKey {
    return '';
  }

  @override
  PusherChannelsOptions get pusherChannelsOptions {
    return PusherChannelsOptions.fromCluster(
      scheme: 'wss',
      cluster: 'ap2',
      key: '',
      port: 443,
    );
  }

  @override
  String get dashboardUrl {
    return 'http://192.168.0.153:8000/home';
  }
}
