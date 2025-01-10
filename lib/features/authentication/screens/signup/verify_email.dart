import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstore/data/repositories/auth/auth_repositories.dart';
import 'package:flutterstore/features/authentication/controller/signup/verify_email_controller.dart';
import 'package:flutterstore/features/authentication/screens/login/login.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              // Get.offAll(() => const LoginScreen());
              AuthenticationRepository.instance.logout();
            },
            icon: const Icon(
              CupertinoIcons.clear,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Images

              Image(
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // Title and SubTitle
              Text(
                TText.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              Text(
                TText.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Buttons

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (() {
                      //
                      Get.to(() => controller.checkEmailVerifiedStatus()
                          //  SuccessScreen(
                          //       title: TText.yourAccountCreatedTitle,
                          //       subtitle: TText.yourAccountCreatedSubTitle,
                          //       onPressed: (() =>
                          //           Get.to(() => const LoginScreen())),
                          //       // onPressed: (() {}),
                          //       image: TImages.staticSuccessIllustration,
                          //     )

                          );
                    }),
                    child: const Text(
                      TText.tContinue,
                    )),
              ),

              // Resend email

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: (() {
                      controller.sendEmailVerification();
                    }),
                    child: const Text(
                      TText.resendEmail,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
