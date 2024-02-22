// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAUl_IC0YEpBoS3WdzYsczEH2hPZ2qm2rA',
    appId: '1:713237280952:web:1762234283fc7bb6a45c4d',
    messagingSenderId: '713237280952',
    projectId: 'yattra-b5fac',
    authDomain: 'yattra-b5fac.firebaseapp.com',
    storageBucket: 'yattra-b5fac.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZo0PrZvAEVSMAn-4GBhv86_WKA6vXq6Q',
    appId: '1:713237280952:android:3b636778931bbe99a45c4d',
    messagingSenderId: '713237280952',
    projectId: 'yattra-b5fac',
    storageBucket: 'yattra-b5fac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhDcZkqU4tnRzEFvGRrXvnjIX1d8mtAxc',
    appId: '1:713237280952:ios:fb063b5cba5e73f3a45c4d',
    messagingSenderId: '713237280952',
    projectId: 'yattra-b5fac',
    storageBucket: 'yattra-b5fac.appspot.com',
    iosBundleId: 'com.example.bus',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDhDcZkqU4tnRzEFvGRrXvnjIX1d8mtAxc',
    appId: '1:713237280952:ios:b66dbf3011a65b78a45c4d',
    messagingSenderId: '713237280952',
    projectId: 'yattra-b5fac',
    storageBucket: 'yattra-b5fac.appspot.com',
    iosBundleId: 'com.example.bus.RunnerTests',
  );
}