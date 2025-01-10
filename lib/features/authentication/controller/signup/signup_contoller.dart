import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterstore/data/repositories/auth/auth_repositories.dart';
import 'package:flutterstore/data/repositories/user/user_repo.dart';
import 'package:flutterstore/features/authentication/model/userModel.dart';
import 'package:flutterstore/features/authentication/screens/signup/verify_email.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/helpers/network_manager.dart';
import 'package:flutterstore/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';
import '../../../../utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // variable
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  // Signup

  Future<void> signUp() async {
    try {
      // start loading
      log('here1');
      FullScreenLoader.openLoadingDialog(
        'We Are Processing Your Information....',
        // TImages.verifyIllustration,
        TImages.docer,
      );
      log('here2');
      //check internet connect
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      log('here3');
      //Form validation

      if (!signUpFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      log('here4');
      //privacy policy check
      if (!privacyPolicy.value) {
        AnimationLoaderWidget.warningSnackBar(
            title: "Accept The Privacy Policy",
            message:
                "In order to create account you must have to read and accept the privacy policy");
      }
      log('here5');

      //Register user in firebase and store user in firebase

      final user =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );
      log('here6');
      log('here6${user.user!.uid}');

      //save authenticated user data in firebase firestore
      final newUser = UserModel(
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text,
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
        id: user.user!.uid,
      );
      log('here7');
      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);
      log('here8');
      AnimationLoaderWidget.successSnackBar(
          title: 'Congrats!!!',
          message:
              'Congratulation Your Account is Created Verify Email to continue');

      log('here9');

      FullScreenLoader.stopLoading();
      log('here10');

      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
      log('here11');

      //show success screen

      //Move toverify email

    } catch (e) {
      log('here5');
      // show some generic error
      AnimationLoaderWidget.errorSnackBar(
        title: 'Oh Snap ....',
        message: e.toString(),
      );
    }
  }
}
