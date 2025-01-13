import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterstore/data/repositories/auth/auth_repositories.dart';
import 'package:flutterstore/features/personalization/controller/user_controller.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/helpers/network_manager.dart';
import 'package:flutterstore/utils/popups/full_screen_loader.dart';
import 'package:flutterstore/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  @override
  void onInit() {
    super.onInit();

    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read("REMEMBER_ME_PASSWORD");
  }

  // variables
  final localStorage = GetStorage();
  final RxBool rememberme = false.obs;
  final RxBool togglePasswordVisibility = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final userController = Get.put(UserController());

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Email And Password Signin

  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
        "Logging You In ....",
        TImages.docer,
      );

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Save Data if remeber me is selected
      if (rememberme.value) {
        localStorage.write(
          "REMEMBER_ME_EMAIL",
          email.text.trim(),
        );
        localStorage.write(
          "REMEMBER_ME_PASSWORD",
          password.text.trim(),
        );
      }

      // login user using email and pass word

      final userCredentials =
          await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // remove Loader

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      AnimationLoaderWidget.errorSnackBar(
        title: 'oh Snap ...!!',
        message: e.toString(),
      );
    }
  }

  // Google SignIn

  Future<void> googleSignIn() async {
    try {
      log('1');
      FullScreenLoader.openLoadingDialog(
        "Logging You In ....",
        TImages.onBoardingImage1,
      );
      log('2');
      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      log('3');
      // Google Authentication
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();
      log('4');
      // Save user Records
      await userController.saveUserRecord(userCredential);
      // remove loader
      FullScreenLoader.stopLoading();
      log('5');
      // redirect

      AuthenticationRepository.instance.screenRedirect();
      AnimationLoaderWidget.successSnackBar(
        title: "Congrats",
        message: "Loggin success",
      );
    } catch (e) {
      FullScreenLoader.stopLoading();
      AnimationLoaderWidget.errorSnackBar(
        title: 'oh Snap ...!!',
        message: e.toString(),
      );
    }
  }
   
  // Forget Password

  Future<void> ForgetPassword() async{}


}
