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
    apiKey: 'AIzaSyCu8-pQm581qtytzviGTlyGWolGqyBbXng',
    appId: '1:335931734535:web:e4d4c6ce8eab1dc33bc8a2',
    messagingSenderId: '335931734535',
    projectId: 'avatende-7ae97',
    authDomain: 'avatende-7ae97.firebaseapp.com',
    storageBucket: 'avatende-7ae97.appspot.com',
    measurementId: 'G-KWP1EJXE2G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBT9GzdPW-Aw-IoYvzZF9slEHwfmplBOX4',
    appId: '1:335931734535:android:7e65952cee96c4013bc8a2',
    messagingSenderId: '335931734535',
    projectId: 'avatende-7ae97',
    storageBucket: 'avatende-7ae97.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCwZ2keGd7VUraDuNJSbIE_HfstJrKptoM',
    appId: '1:335931734535:ios:ac20f5ccb46682673bc8a2',
    messagingSenderId: '335931734535',
    projectId: 'avatende-7ae97',
    storageBucket: 'avatende-7ae97.appspot.com',
    iosClientId:
        '335931734535-rkf5qv7q708b9bal9728tdq5tm6eihct.apps.googleusercontent.com',
    iosBundleId: 'com.jodaias.avatende',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCwZ2keGd7VUraDuNJSbIE_HfstJrKptoM',
    appId: '1:335931734535:ios:8ec00c3b200c478d3bc8a2',
    messagingSenderId: '335931734535',
    projectId: 'avatende-7ae97',
    storageBucket: 'avatende-7ae97.appspot.com',
    iosClientId:
        '335931734535-cjup7qnghs31um2ua4frvpi1s4o8oc90.apps.googleusercontent.com',
    iosBundleId: 'com.jodaias.avatendeMobx',
  );
}