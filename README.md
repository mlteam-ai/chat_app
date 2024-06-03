# chat_app

A sample Flutter project based on the Udemy course [Flutter & Dart - The Complete Guide [2024 Edition]](https://www.udemy.com/course/fluhttps://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/).

![Here is the recording of the app](recording.gif)

NOTE - The app is configured for and tested on iOS only.

## What is in This Project?

* Using Firebase Authentication for login, signup, logout.
* Using Firebase Storage for storing images.
* Using Firebase Firestore for storing chat messages.
* Using Firebase Cloud Messaging for sending push notifications.
* Adding a splash screen.
* Using device camera
* Using StreamBuilder with Firestore collection snapshots as a stream.
* Styling chat message bubbles.


## Installed Packages

```shell
flutter pub add image_picker
flutter pub add firebase_core
flutter pub add firebase_auth
flutter pub add firebase_storage
flutter pub add cloud_firestore
flutter pub add firebase_messaging
```

## Additional Resources

* [Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup?platform=ios)
* [Firebase Authentication](https://firebase.google.com/docs/auth)
* [Firebase Firestore](https://firebase.google.com/docs/firestore)
* [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging)
* [Firebase Storage](https://firebase.google.com/docs/storage)
* [Firebase Cloud Functions](https://firebase.google.com/docs/functions)
* [Firebase Console](https://console.firebase.google.com/)
* [Firebase CLI](https://firebase.google.com/docs/cli)

## Firebase Setup

```shell
curl -sL https://firebase.tools | bash
firebase login
dart pub global activate flutterfire_cli
flutterfire configure
```


