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
    apiKey: 'AIzaSyCKyOmnfaHHhXw3tZNH7Ela-_3IsR_6DbU',
    appId: '1:1052606400660:web:6672898c151aeffba5cc81',
    messagingSenderId: '1052606400660',
    projectId: 'elzefir',
    authDomain: 'elzefir.firebaseapp.com',
    storageBucket: 'elzefir.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzRVCg0fq6fUvziGOgs2cKGeqySv7hVFs',
    appId: '1:1052606400660:android:25198788e67819d9a5cc81',
    messagingSenderId: '1052606400660',
    projectId: 'elzefir',
    storageBucket: 'elzefir.firebasestorage.app',
  );
}
