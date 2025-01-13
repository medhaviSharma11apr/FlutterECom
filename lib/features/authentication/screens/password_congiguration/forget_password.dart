import 'package:flutter/material.dart';
import 'package:flutterstore/features/authentication/controller/forget_password/forget_password_controller.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:flutterstore/utils/validators/validation.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
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

            Form(
              key: controller.forgetpasswordformkey,
              child: TextFormField(
                validator: ((value) => Validator.validateEmail(value)),
                controller: controller.email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(),
                    ),
                    labelText: TText.email,
                    prefixIcon: const Icon(Icons.directions)),
              ),
            ),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            // Submit Button

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.off(() => controller.sendPasswordResetEmail());
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
