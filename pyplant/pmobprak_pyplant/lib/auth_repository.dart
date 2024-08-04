// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:pyplant/HomePage.dart';
// import 'package:pyplant/LoginPage.dart';
// import 'package:pyplant/SignUp.dart';

// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();

//   //variables
//   final deviceStorage = GetStorage();
//   final _auth = FirebaseAuth.instance;

//   //called from main.dart on app launch
//   @override
//   void onReady() {
//     //redirect to the appropriate screen
//     screenRedirect();
//   }

//   //function to show relevant screen
//   void screenRedirect() async {
//     final user = _auth.currentUser;

//     if (user != null) {
//       //if the user is logged in
//       if (user.emailVerified) {
//         Get.offAll(() => const HomePage());
//       } else {
//         Get.offAll(() => const SignUp());
//       }
//     } else {
//       //local storage
//       deviceStorage.writeIfNull('IsFirstTime', true);

//       //check if its first time lauch app
//       deviceStorage.read('IsFirstTime') != true 
//       ? Get.offAll(() => const LoginPage()) //redirect to login if not the first time
//       : Get.offAll(const HomePage()); //redirect to welcome screen if first time
//     }
//   }

//   /* --------------------- email & password sign in --------------------- */

//   //[email authentication] - sign in
//   Future<UserCredential> loginWithEmailandPassword(String email, String password) async {
//   try {
//     // Melakukan login dengan email dan kata sandi
//     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
    
//     return userCredential;
//   } on FirebaseAuthException catch (e) {
//     throw FirebaseAuthException(message: e.message, code: e.code);
//   } on FirebaseException catch (e) {
//     throw FirebaseException(plugin: e.plugin, message: e.message, code: e.code);
//   } on FormatException catch (_) {
//     throw const FormatException('Format input tidak valid.');
//   } on PlatformException catch (e) {
//     throw PlatformException(code: e.code, message: e.message);
//   } catch (e) {
//     throw Exception('Terjadi kesalahan. Silakan coba lagi.');
//   }
// }

//   //[email authentication] - sign up 
//   Future<UserCredential> registerWithEmailandPassword(String displayName, String email, String password) async {
//   try {
//     // Create the user with email and password
//     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );

//     // Update the displayName after user creation
//     await userCredential.user?.updateDisplayName(displayName);
//     await userCredential.user?.reload();

//     return userCredential;
//   } on FirebaseAuthException catch (e) {
//     throw FirebaseAuthException(message: e.message, code: e.code);
//   } on FirebaseException catch (e) {
//     throw FirebaseException(plugin: e.plugin, message: e.message, code: e.code);
//   } on FormatException catch (_) {
//     throw const FormatException('Invalid input format.');
//   } on PlatformException catch (e) {
//     throw PlatformException(code: e.code, message: e.message);
//   } catch (e) {
//     throw Exception('Something went wrong. Please try again');
//   }
// }

//   }

// class TFirebaseAuthException implements Exception {
//   final String code;

//   TFirebaseAuthException(this.code);

//   String get message {
//     switch (code) {
//       case 'email-already-in-use':
//         return 'The email address is already registered. Please use a different email';
//       default:
//         return 'An error occurred during authentication: $code';
//     }
//   }
// }

// class TFirebaseException implements Exception {
//   final String code;

//   TFirebaseException(this.code);

//   String get message {
//     return 'TFirebaseException: $code';
//   }
// }

// class TFormatException implements Exception {
//   final String message;

//   const TFormatException({this.message = 'Format Exception'});

//   @override
//   String toString() {
//     return 'TFormatException: $message';
//   }
// }

// class TPlatformException implements Exception {
//   final String code;
//   final String message;

//   TPlatformException(this.code, {this.message = 'Platform Exception'});

//   @override
//   String toString() {
//     return 'TPlatformException: $code - $message';
//   }
// }