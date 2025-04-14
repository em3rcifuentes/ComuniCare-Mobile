import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
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
    apiKey: 'AIzaSyDhbdhcOcV4_K8uFQQipgAF3L9Nc2GeK2w',
    appId: '1:364114296012:web:6f2793a5c7f3a8be7fd669',
    messagingSenderId: '364114296012',
    projectId: 'comunicare-app-e3e95',
    authDomain: 'comunicare-app-e3e95.firebaseapp.com',
    storageBucket: 'comunicare-app-e3e95.firebasestorage.app',
    measurementId: 'G-KE6VJFJGC7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhuuFkX-e3-M77IfyZ6hW5xoyUZBrosio',
    appId: '1:364114296012:android:94e25e1da7c11a447fd669',
    messagingSenderId: '364114296012',
    projectId: 'comunicare-app-e3e95',
    storageBucket: 'comunicare-app-e3e95.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2PrK58pBxNrl4R3pqnf9y4Ls-UYCNxmw',
    appId: '1:364114296012:ios:a452245257eeb1ad7fd669',
    messagingSenderId: '364114296012',
    projectId: 'comunicare-app-e3e95',
    storageBucket: 'comunicare-app-e3e95.firebasestorage.app',
    iosBundleId: 'com.example.comunicareApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB2PrK58pBxNrl4R3pqnf9y4Ls-UYCNxmw',
    appId: '1:364114296012:ios:a452245257eeb1ad7fd669',
    messagingSenderId: '364114296012',
    projectId: 'comunicare-app-e3e95',
    storageBucket: 'comunicare-app-e3e95.firebasestorage.app',
    iosBundleId: 'com.example.comunicareApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDhbdhcOcV4_K8uFQQipgAF3L9Nc2GeK2w',
    appId: '1:364114296012:web:5e259ed52b801abc7fd669',
    messagingSenderId: '364114296012',
    projectId: 'comunicare-app-e3e95',
    authDomain: 'comunicare-app-e3e95.firebaseapp.com',
    storageBucket: 'comunicare-app-e3e95.firebasestorage.app',
    measurementId: 'G-HV7D70JDN5',
  );
}
