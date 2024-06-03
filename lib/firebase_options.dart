// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyCKvSImwt28qpwOznAwRI_CCSSvleB7E3A',
    appId: '1:988234851892:web:ca84c67ca56aae65b44c61',
    messagingSenderId: '988234851892',
    projectId: 'mlteam-dummy-backend',
    authDomain: 'mlteam-dummy-backend.firebaseapp.com',
    databaseURL: 'https://mlteam-dummy-backend-default-rtdb.firebaseio.com',
    storageBucket: 'mlteam-dummy-backend.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD839ddkuyVinOSy0t806weux7ACRlgZnY',
    appId: '1:988234851892:android:6da2bbfb889f3e95b44c61',
    messagingSenderId: '988234851892',
    projectId: 'mlteam-dummy-backend',
    databaseURL: 'https://mlteam-dummy-backend-default-rtdb.firebaseio.com',
    storageBucket: 'mlteam-dummy-backend.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAo-ANsU5glQ5PHUmGPA00EK7vv1gwonX8',
    appId: '1:988234851892:ios:39089a1f1eb51963b44c61',
    messagingSenderId: '988234851892',
    projectId: 'mlteam-dummy-backend',
    databaseURL: 'https://mlteam-dummy-backend-default-rtdb.firebaseio.com',
    storageBucket: 'mlteam-dummy-backend.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

}