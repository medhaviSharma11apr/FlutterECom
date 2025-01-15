import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterstore/data/repositories/user/user_repo.dart';
import 'package:flutterstore/features/personalization/controller/user_controller.dart';
import 'package:flutterstore/features/personalization/screens/profile/profile.dart';
import 'package:flutterstore/utils/helpers/network_manager.dart';
import 'package:flutterstore/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';

import '../../../utils/constanats/image_string.dart';
import '../../../utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // init user dataa when Home screen appers
  @override
  void onInit() {
    super.onInit();
    initializeNames();
  }

  // Fetch User record
  Future<void> initializeNames() async {
    firstName.text = userController.userModel.value.firstName;
    lastName.text = userController.userModel.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      log('2');
      // start loading
      FullScreenLoader.openLoadingDialog(
        'We Are updating your information .... ',
        TImages.docer,
      );
      log('3');
      //Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      log('4');
      // Update User's first a nd lats nAME IN FIREBAE
      Map<String, dynamic> name = {
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim(),
      };
      log('5');
      await userRepository.updateSingleField(name);

      // update rx user value
      log('6');
      userController.userModel.value.firstName = firstName.text.trim();
      userController.userModel.value.lastName = lastName.text.trim();
      log('7');
      // Remove Loader
      FullScreenLoader.stopLoading();
      // show snackbar
      log('8');
      AnimationLoaderWidget.successSnackBar(
          title: "Congratulations ...!",
          message: 'Your Name has been updated ...!!');

      // Move To previous screen
      log('9');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      // Remove Loader
      FullScreenLoader.stopLoading();
      AnimationLoaderWidget.errorSnackBar(
        title: 'Oh Snap',
        message: e.toString(),
      );
    }
  }
}
