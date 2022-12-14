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
    apiKey: 'AIzaSyDdRe7gWT8E1j-VAX_5U7eLNNGcib2avNY',
    appId: '1:551369702999:web:de0e4f3774943d0d17ed12',
    messagingSenderId: '551369702999',
    projectId: 'instagram-clone-kamranhccp',
    authDomain: 'instagram-clone-kamranhccp.firebaseapp.com',
    storageBucket: 'instagram-clone-kamranhccp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmY8-QbS6UiUdojE9W0MKhBhd8PcESSlc',
    appId: '1:551369702999:android:9e9f07b8447e760917ed12',
    messagingSenderId: '551369702999',
    projectId: 'instagram-clone-kamranhccp',
    storageBucket: 'instagram-clone-kamranhccp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlQDBU-hJ6TrnAoA8cxoyeQQ3anhSK29I',
    appId: '1:551369702999:ios:5654a4c230b4348f17ed12',
    messagingSenderId: '551369702999',
    projectId: 'instagram-clone-kamranhccp',
    storageBucket: 'instagram-clone-kamranhccp.appspot.com',
    iosClientId: '551369702999-nft4c340h7ddkc1i7b40ae4js844jrq8.apps.googleusercontent.com',
    iosBundleId: 'com.kamranhccp.instagramclone.instagramCloneKamranhccp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBlQDBU-hJ6TrnAoA8cxoyeQQ3anhSK29I',
    appId: '1:551369702999:ios:5654a4c230b4348f17ed12',
    messagingSenderId: '551369702999',
    projectId: 'instagram-clone-kamranhccp',
    storageBucket: 'instagram-clone-kamranhccp.appspot.com',
    iosClientId: '551369702999-nft4c340h7ddkc1i7b40ae4js844jrq8.apps.googleusercontent.com',
    iosBundleId: 'com.kamranhccp.instagramclone.instagramCloneKamranhccp',
  );
}
