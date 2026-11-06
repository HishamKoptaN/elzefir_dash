import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DevFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        return windows;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDkDmz0_Ee1GOD74Fxw23SYVmzTEP_-Odg',
    appId: '1:947607550746:web:e8bb6c77a323751a720aa3',
    messagingSenderId: '947607550746',
    projectId: 'elzefir-dev',
    authDomain: 'elzefir-dev.firebaseapp.com',
    storageBucket: 'elzefir-dev.firebasestorage.app',
    measurementId: 'G-TTNHN9CD8X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrQbuzT6edhEEEJj6b1eT2l8cU-NgfTkQ',
    appId: '1:947607550746:android:52911c2af3413117720aa3',
    messagingSenderId: '947607550746',
    projectId: 'elzefir-dev',
    storageBucket: 'elzefir-dev.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDkDmz0_Ee1GOD74Fxw23SYVmzTEP_-Odg',
    appId: '1:947607550746:web:e194da2c2573c229720aa3',
    messagingSenderId: '947607550746',
    projectId: 'elzefir-dev',
    authDomain: 'elzefir-dev.firebaseapp.com',
    storageBucket: 'elzefir-dev.firebasestorage.app',
    measurementId: 'G-271D93E0HH',
  );
}
