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
    apiKey: 'AIzaSyA2VriEXZCVoakeqd7pIYA9dC-2pdIKjh0',
    appId: '1:252925243377:web:dcfcb92166bf682f4ade50',
    messagingSenderId: '252925243377',
    projectId: 'sos-central-bccdf',
    authDomain: 'sos-central-bccdf.firebaseapp.com',
    storageBucket: 'sos-central-bccdf.appspot.com',
    measurementId: 'G-MF5J4HX003',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXfXzpyk6rH0rwh0YPvIcICCtX23Q6eWw',
    appId: '1:252925243377:android:6440a83f25d1cb424ade50',
    messagingSenderId: '252925243377',
    projectId: 'sos-central-bccdf',
    storageBucket: 'sos-central-bccdf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAh0oYnI3UsXaGwGoZD3naaA-sJkZf_80c',
    appId: '1:252925243377:ios:5cddad0ef0cbb93e4ade50',
    messagingSenderId: '252925243377',
    projectId: 'sos-central-bccdf',
    storageBucket: 'sos-central-bccdf.appspot.com',
    iosBundleId: 'com.example.partyHub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAh0oYnI3UsXaGwGoZD3naaA-sJkZf_80c',
    appId: '1:252925243377:ios:5cddad0ef0cbb93e4ade50',
    messagingSenderId: '252925243377',
    projectId: 'sos-central-bccdf',
    storageBucket: 'sos-central-bccdf.appspot.com',
    iosBundleId: 'com.example.partyHub',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA2VriEXZCVoakeqd7pIYA9dC-2pdIKjh0',
    appId: '1:252925243377:web:462941a758a1d6df4ade50',
    messagingSenderId: '252925243377',
    projectId: 'sos-central-bccdf',
    authDomain: 'sos-central-bccdf.firebaseapp.com',
    storageBucket: 'sos-central-bccdf.appspot.com',
    measurementId: 'G-B0WJD3N4VB',
  );

}