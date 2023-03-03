import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6qpGZmj_JCOQxtbWZXiwb-RQjRgGQZv4',
    appId: '1:368330806709:android:dc928ff62083997ef8b5fc',
    messagingSenderId: '368330806709',
    projectId: 'chromepay',
    storageBucket: 'chromepay.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADl3XcIqjPtHhSDenw8V4XB26mMGdc62s',
    appId: '1:368330806709:ios:29ac7c8ab943826cf8b5fc',
    messagingSenderId: '368330806709',
    projectId: 'chromepay',
    storageBucket: 'chromepay.appspot.com',
    iosClientId: '368330806709-3b0k2g0bf73on8ct3uf8mqmo6ad8da0k.apps.googleusercontent.com',
    iosBundleId: 'com.example.chromePayMobileFlutter',
  );
}
