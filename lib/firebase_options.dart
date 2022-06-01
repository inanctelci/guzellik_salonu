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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB79_7cWQ3hXPH5t75eJAEB0JXXtB7Qstk',
    appId: '1:287159082461:web:e30335c2868bd03232ea34',
    messagingSenderId: '287159082461',
    projectId: 'guzellik-salonu-app',
    authDomain: 'guzellik-salonu-app.firebaseapp.com',
    storageBucket: 'guzellik-salonu-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAC8Gw4fi8wNZe4Ow_zW0OQr6BJMTIVSts',
    appId: '1:287159082461:android:e5f0e9397fb7ad5b32ea34',
    messagingSenderId: '287159082461',
    projectId: 'guzellik-salonu-app',
    storageBucket: 'guzellik-salonu-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXSAdogHmu_lUNjonbE6yrMk3pKd0xhgo',
    appId: '1:287159082461:ios:d27d0b53cda346f432ea34',
    messagingSenderId: '287159082461',
    projectId: 'guzellik-salonu-app',
    storageBucket: 'guzellik-salonu-app.appspot.com',
    iosClientId: '287159082461-c9v22eqaco217jsomj23p4u000fcrmg2.apps.googleusercontent.com',
    iosBundleId: 'com.example.guzellikSalonu',
  );
}