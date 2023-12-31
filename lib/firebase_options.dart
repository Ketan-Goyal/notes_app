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
    apiKey: 'AIzaSyBEb0bpAWODCFVBvIaAJPrFWcnTCigfOg4',
    appId: '1:710950277061:web:ab6f923c09fc87655145ac',
    messagingSenderId: '710950277061',
    projectId: 'notes-app-ketan',
    authDomain: 'notes-app-ketan.firebaseapp.com',
    storageBucket: 'notes-app-ketan.appspot.com',
    measurementId: 'G-8F4V9DCLCK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFLjRvVDBVmgFcBLrM-AkEAWzqbdomlx8',
    appId: '1:710950277061:android:d75cefaa248798215145ac',
    messagingSenderId: '710950277061',
    projectId: 'notes-app-ketan',
    storageBucket: 'notes-app-ketan.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsgpeqDNPOWtbT9xthso-tossgVtrmBtw',
    appId: '1:710950277061:ios:e680a50d2f43fef45145ac',
    messagingSenderId: '710950277061',
    projectId: 'notes-app-ketan',
    storageBucket: 'notes-app-ketan.appspot.com',
    iosClientId: '710950277061-9umessfjunee8rt37v8ljttef9uapvih.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesApp',
  );
}
