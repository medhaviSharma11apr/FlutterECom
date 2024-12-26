import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstore/features/authentication/screens/login/login.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';
import 'package:get/get.dart';
import '../../../../utils/constanats/image_string.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: (() {
              Get.back();
            }),
            icon: const Icon(
              CupertinoIcons.clear,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // Title and SubTitle
              Text(
                TText.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              Text(
                TText.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (() {
                    Get.to(
                      () => const LoginScreen(),
                    );
                  }),
                  child: const Text(
                    TText.done,
                  ),
                ),
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: (() {
                    // Get.to(() => const LoginScreen());
                  }),
                  child: const Text(
                    TText.resendEmail,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
