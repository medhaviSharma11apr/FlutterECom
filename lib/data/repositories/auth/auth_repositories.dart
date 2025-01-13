import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutterstore/features/authentication/screens/login/login.dart';
import 'package:flutterstore/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutterstore/features/authentication/screens/signup/verify_email.dart';
import 'package:flutterstore/navigation_menu.dart';
import 'package:flutterstore/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:flutterstore/utils/exceptions/firebase_exceptions.dart';
import 'package:flutterstore/utils/exceptions/format_exceptions.dart';
import 'package:flutterstore/utils/exceptions/platform_exceptions.dart';
import 'package:flutterstore/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // called from main.dart when app launches
  @override
  void onReady() {
    log('rachedon ready');
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // to show the relevant screen

  screenRedirect() {
    User? user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(const NavigationMenu());
      } else {
        Get.offAll(VerifyEmailScreen(
          email: _auth.currentUser?.email,
        ));
      }
    } else {
      // device storage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  // --- Federated Identity Google Sign in
  // [Google Authentication]
  Future<UserCredential> signInWithGoogle() async {
    try {
      // trigger the authentication flow
      log('11');
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      log('12');
      // obtain auth detail from request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      log('13');
      // create new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken,
        idToken: googleAuth.idToken,
      );
      log('14');
      // once signed in return the user credentials

      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      log('FireBaseAuth$e');
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      log('FirebaseException$e');
      throw TFirebaseException(e.code).message;
    } on FormatException {
      log('formatExcep');
      throw const TFormatException();
    } on PlatformException catch (e) {
      log('platform$e');
      throw TPlatformException(e.code).message;
    } catch (e) {
      log('platformeeee$e');
      print('platformeeee$e');
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    }
  }

  // ------- Sign in method -------

  // Email Auth LogIn

  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    }
  }

  // Email Auth Register

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    } on FirebaseException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    } on FormatException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    } on PlatformException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    } catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    }
  }

  // Email[verification] -- MAIL VERIFY

  Future<void> sendEmailVerification() async {
    try {
      _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    } on FirebaseException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    } on FormatException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    } on PlatformException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    } catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    }
  }
  // EMAIL AUTHENTICATION --- FORGET PASSWORD

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    } on FirebaseException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    } on FormatException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    } on PlatformException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    } catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    }
  }

  // logout
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    } on FirebaseException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    } on FormatException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    } on PlatformException catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    } catch (e) {
      throw AnimationLoaderWidget.errorSnackBar(title: e.toString());
    }
  }
}
