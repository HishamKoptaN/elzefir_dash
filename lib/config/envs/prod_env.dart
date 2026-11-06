import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import '../env.dart';
import '../env_config.dart';
import '../firebase/firebase_options_prod.dart';

class ProdEnv implements Env {
  @override
  DataSrcMode get dataSourceMode {
    return .api;
  }
  @override
  FirebaseOptions get firebaseOptions {
    return ProdFirebaseOptions.currentPlatform;
  }
  @override
  String get baseUrl {
    return 'https://odhea.com/api/admin/';
  }
  @override
  String get authBaseUrl {
    return 'https://odhea.com/api/auth/';
  }
  @override
  bool get enableLogging => false;
  @override
  String get vapidKey =>
      'BFGt9-pcSAFclpHVnYRhDrm-rSCnYQvFEiejFU6g39v1RnyQnclua7On4BE1-du0OKu4IgMCMv_GVq07nwS8-HU';
  @override
  String get dashboardUrl => 'https://odhea.com';
  @override
  PusherChannelsOptions get pusherChannelsOptions =>
      PusherChannelsOptions.fromCluster(
        scheme: 'wss',
        cluster: 'ap2',
        key: '20d4b11b8a1794284239',
        port: 443,
      );
}

final Env env = ProdEnv();
