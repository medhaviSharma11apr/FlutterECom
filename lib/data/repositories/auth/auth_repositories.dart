import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutterstore/features/authentication/screens/login/login.dart';
import 'package:flutterstore/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutterstore/features/authentication/screens/signup/verify_email.dart';
import 'package:flutterstore/navigation_menu.dart';
import 'package:flutterstore/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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

  // ------- Sign in method -------

  // Email Auth SignIn

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

    // logout
  }

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
