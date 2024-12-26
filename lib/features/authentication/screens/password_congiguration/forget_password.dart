import 'package:flutter/material.dart';
import 'package:flutterstore/features/authentication/screens/password_congiguration/reset_password.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              TText.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            Text(
              TText.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),

            const SizedBox(
              height: TSizes.spaceBtwSections * 2,
            ),

            // TextField

            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(),
                  ),
                  labelText: TText.email,
                  prefixIcon: const Icon(Icons.directions)),
            ),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            // Submit Button

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.off(() => const ResetPassword());
                },
                child: const Text(TText.submit),
              ),
            )
          ],
        ),
      ),
    );
  }
}
