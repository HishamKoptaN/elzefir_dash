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
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCusHoAiX9Dpogg_1UQzw_IicBhb3NBrVM',
    appId: '1:843078461358:web:7be639247388b1a464ca3f',
    messagingSenderId: '843078461358',
    projectId: 'alzefr',
    authDomain: 'alzefr.firebaseapp.com',
    storageBucket: 'alzefr.firebasestorage.app',
    measurementId: 'G-CQTX2QHYTZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnYX3yfrQEValt_uZoDMxVmMJcCTTP1HA',
    appId: '1:843078461358:android:8a47ed1499f94ac264ca3f',
    messagingSenderId: '843078461358',
    projectId: 'alzefr',
    storageBucket: 'alzefr.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABEcWPhYvWGigFPQIwRAUJMZPr4_llBeU',
    appId: '1:843078461358:ios:ad08d247a38ca31164ca3f',
    messagingSenderId: '843078461358',
    projectId: 'alzefr',
    storageBucket: 'alzefr.firebasestorage.app',
    iosBundleId: 'com.example.alzefr',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyABEcWPhYvWGigFPQIwRAUJMZPr4_llBeU',
    appId: '1:843078461358:ios:ad08d247a38ca31164ca3f',
    messagingSenderId: '843078461358',
    projectId: 'alzefr',
    storageBucket: 'alzefr.firebasestorage.app',
    iosBundleId: 'com.example.alzefr',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCusHoAiX9Dpogg_1UQzw_IicBhb3NBrVM',
    appId: '1:843078461358:web:04c947a1b6b8235c64ca3f',
    messagingSenderId: '843078461358',
    projectId: 'alzefr',
    authDomain: 'alzefr.firebaseapp.com',
    storageBucket: 'alzefr.firebasestorage.app',
    measurementId: 'G-Z54WPY82TN',
  );
}
