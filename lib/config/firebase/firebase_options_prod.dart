import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class ProdFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for this platform - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDa5tsdgfGYP378YlBC_P3BwqGcBZWzwsg',
    appId: '1:1057189524284:web:e3d3031f7da5ad94d62439',
    messagingSenderId: '1057189524284',
    projectId: 'elzefir-dbb8d',
    authDomain: 'elzefir-dbb8d.firebaseapp.com',
    storageBucket: 'elzefir-dbb8d.firebasestorage.app',
    measurementId: 'G-KMSJVTFYHE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8pjelajX2Rt9E7MYvy3qusrq3EoTHf8g',
    appId: '1:1057189524284:android:9d01e04329fc5816d62439',
    messagingSenderId: '1057189524284',
    projectId: 'elzefir-dbb8d',
    storageBucket: 'elzefir-dbb8d.firebasestorage.app',
  );
}
