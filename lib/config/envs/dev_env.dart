import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import '../env.dart';
import '../env_config.dart';
import '../firebase/firebase_options_dev.dart';

class DevEnv extends Env {
  @override
  DataSrcMode get dataSourceMode {
    return .mock;
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
    return 'https://hotpink-gnu-383634.hostingersite.com/api/admin/';
  }

  @override
  String get authBaseUrl {
    return 'https://hotpink-gnu-383634.hostingersite.com/api/auth/';
  }

  @override
  String get vapidKey {
    return 'BJrANZ5ArkykYI3lFQx1dLjaS0KvFh65CrIQmlkE8zakJOAbQHn6h5J78UmCpDZPyoqC-k8caMZNK-HOVswUaeo';
  }

  @override
  String get dashboardUrl {
    return 'https://hotpink-gnu-383634.hostingersite.com';
  }

  @override
  PusherChannelsOptions get pusherChannelsOptions {
    return PusherChannelsOptions.fromCluster(
      scheme: 'wss',
      cluster: 'ap2',
      key: '3781a6c8a1db2dad0259',
      port: 443,
    );
  }
}
