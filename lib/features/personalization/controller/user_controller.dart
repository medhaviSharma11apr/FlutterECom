import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterstore/data/repositories/auth/auth_repositories.dart';
import 'package:flutterstore/data/repositories/user/user_repo.dart';
import 'package:flutterstore/features/authentication/model/userModel.dart';
import 'package:flutterstore/features/authentication/screens/login/login.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/helpers/network_manager.dart';
import 'package:flutterstore/utils/popups/full_screen_loader.dart';
import 'package:flutterstore/utils/popups/loaders.dart';
import 'package:get/get.dart';
import '../../../utils/constanats/image_string.dart';
import '../screens/profile/widgets/re_authenticate_user_login_form_key.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  var userRepository   = Get.put(UserRepository());
  Rx<UserModel> userModel = UserModel.empty().obs;
  final profileLoading = false.obs;

  final hidePassword   =   false.obs;
  final verifyEmail    = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // save user record from any regisration provider

  Future<void> fetchUserRecord() async {
    profileLoading.value = true;
    try {
      final user = await userRepository.fetchUserDetail();
      userModel(user);
    } catch (e) {
      userModel(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      final namePart =
          UserModel.namePart(userCredential.user!.displayName ?? "");

      final userName =
          UserModel.generateUserName(userCredential.user!.displayName ?? "");

      final user = UserModel(
        firstName: namePart[0],
        lastName: namePart.length > 1 ? namePart.sublist(1).join(' ') : '',
        userName: userName,
        email: userCredential.user!.email ?? '',
        phoneNumber: userCredential.user!.phoneNumber ?? '',
        profilePicture: userCredential.user!.photoURL ?? '',
        id: userCredential.user!.uid,
      );

      await userRepository.saveUserRecord(user);
    } catch (e) {
      AnimationLoaderWidget.warningSnackBar(
          title: "Data Not Saved",
          message: "Something Went Wrong While SAving Your Informations");
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText:
            "Are you sure you want to delete your account permanentl? this action is irreversible and all your data will be remove permanently",
        confirm: ElevatedButton(
            onPressed: (() async {
              deleteUserAccount();
            }),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text('Delete'),
            )),
        cancel: OutlinedButton(
            onPressed: (() => Navigator.of(Get.overlayContext!).pop()),
            child: const Text("Cancel")));
  }

  void deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog('Loading', TImages.docer);

      // First Reauthenticate User
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        // Reverify authemail

        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();

          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          FullScreenLoader.stopLoading();
          Get.offAll(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      AnimationLoaderWidget.warningSnackBar(
          title: 'Oh Snap...!!', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateUsingEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );
      await AuthenticationRepository.instance.deleteAccount();

      FullScreenLoader.stopLoading();

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      AnimationLoaderWidget.warningSnackBar(
          title: 'ohSnap', message: e.toString());
    }
    // check Internet
  }
}
