import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/success_screen/success_screen.dart';
import 'package:flutterstore/features/authentication/screens/login/login.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(() => const LoginScreen());
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
                'xyz@gmail.com',
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
                      Get.to(() => const SuccessScreen());
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
                    onPressed: (() {}),
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
