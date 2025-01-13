import 'package:flutter/material.dart';
import 'package:flutterstore/data/repositories/auth/auth_repositories.dart';
import 'package:flutterstore/features/authentication/screens/password_congiguration/reset_password.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/helpers/network_manager.dart';
import 'package:flutterstore/utils/popups/full_screen_loader.dart';
import 'package:flutterstore/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  ForgetPasswordController get instance => Get.find();
  // variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetpasswordformkey = GlobalKey<FormState>();

  //send email and verify

  sendPasswordResetEmail() async {
    try {
      // start Loading

      FullScreenLoader.openLoadingDialog(
        '',
        TImages.docer,
      );

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!forgetpasswordformkey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove the loader

      FullScreenLoader.stopLoading();

      // success scree
      AnimationLoaderWidget.successSnackBar(
          title: "Email Sent",
          message: "Email Link Sent To Reset Your Password".tr);

      /// Redirect
      Get.to(
        () => ResetPassword(
          email: email.text.trim(),
        ),
      );
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

      FullScreenLoader.openLoadingDialog(
        '',
        TImages.docer,
      );

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // form validation
     
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);

      // Remove the loader

      FullScreenLoader.stopLoading();

      // success scree
      AnimationLoaderWidget.successSnackBar(
          title: "Email Sent",
          message: "Email Link Sent To Reset Your Password".tr);




    } catch (e) {
      FullScreenLoader.stopLoading();
      AnimationLoaderWidget.errorSnackBar(
        title: 'Oh Snap !!',
        message: "Email Send To Your Link",
      );
    }
  }
}
