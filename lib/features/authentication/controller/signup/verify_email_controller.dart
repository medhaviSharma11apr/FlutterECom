import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterstore/common/widgets/success_screen/success_screen.dart';
import 'package:flutterstore/data/repositories/auth/auth_repositories.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:flutterstore/utils/popups/loaders.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // send email whenever verify screen appears and set timer for auto redirect

  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    setTimerForAutoRedirect();
  }

  /// send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      AnimationLoaderWidget.successSnackBar(
          title: 'Email Sent',
          message: 'Please check your inbox and verify mail');
    } catch (e) {
      AnimationLoaderWidget.errorSnackBar(
          title: 'Oh Snap... !!', message: e.toString());
    }
  }

  /// Timer to automatically redirect to email verification link

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              title: TText.yourAccountCreatedTitle,
              image: TImages.sucessfulRegistrationAnimation,
              subtitle: TText.yourAccountCreatedSubTitle,
              onPressed: (() {
                AuthenticationRepository.instance.screenRedirect();
              }),
            ));
      } else {}
    });
  }

  /// Manually check if email is verified
  checkEmailVerifiedStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            title: TText.yourAccountCreatedTitle,
            image: TImages.sucessfulRegistrationAnimation,
            subtitle: TText.yourAccountCreatedSubTitle,
            onPressed: (() {
              AuthenticationRepository.instance.screenRedirect();
            }),
          ));
    }
  }
}
