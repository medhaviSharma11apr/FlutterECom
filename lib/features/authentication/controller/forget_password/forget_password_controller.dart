import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterstore/data/repositories/auth/auth_repositories.dart';
import 'package:flutterstore/features/authentication/screens/password_congiguration/reset_password.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/helpers/network_manager.dart';
import 'package:flutterstore/utils/popups/full_screen_loader.dart';
import 'package:flutterstore/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();
  // variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetpasswordformkey = GlobalKey<FormState>();

  //send email and verify

  sendPasswordResetEmail() async {
    try {
      // start Loading
      log('1');
      FullScreenLoader.openLoadingDialog(
        '',
        TImages.docer,
      );

      log('2');

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      log('3');
      // form validation
      if (!forgetpasswordformkey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      log('4');
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove the loader
      log('5');
      FullScreenLoader.stopLoading();

      log('6');

      // success scree
      AnimationLoaderWidget.successSnackBar(
          title: "Email Sent",
          message: "Email Link Sent To Reset Your Password".tr);

      log('7');

      /// Redirect
      Get.to(
        () => ResetPassword(
          email: email.text.trim(),
        ),
      );
      log('8');
    } catch (e) {
      FullScreenLoader.stopLoading();
      AnimationLoaderWidget.errorSnackBar(
        title: 'Oh Snap !!',
        message: "Email Send To Your Link",
      );
    }
  }

  // resend email
  resendPasswordResetEmail(String email) async {
    try {
      // start Loading
      log('1');

      FullScreenLoader.openLoadingDialog(
        '',
        TImages.docer,
      );
      log('2');

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      log('3');

      // form validation

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      log('4');
      // Remove the loader

      FullScreenLoader.stopLoading();
      log('5');

      // success scree
      AnimationLoaderWidget.successSnackBar(
          title: "Email Sent",
          message: "Email Link Sent To Reset Your Password".tr);
      log('6');
    } catch (e) {
      FullScreenLoader.stopLoading();
      AnimationLoaderWidget.errorSnackBar(
        title: 'Oh Snap !!',
        message: "Email Send To Your Link",
      );
    }
  }
}
