import 'package:flutter/material.dart';
import 'package:flutterstore/features/authentication/screens/password_congiguration/forget_password.dart';
import 'package:flutterstore/features/authentication/screens/signup/signup.dart';
import 'package:flutterstore/navigation_menu.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:get/get.dart';

class TloginForm extends StatelessWidget 
{
  const TloginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: TSizes.spaceBtwSections,
      ),
      child: Form(
          child: Column(
        children: [
          //Email Section
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.send,
              ),
              labelText: TText.email,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          // Password Section
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.pin,
                ),
                labelText: TText.password,
                suffixIcon: Icon(
                  Icons.visibility_off,
                )),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields / 2,
          ),

          // Remember me and forget password

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remember me
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: ((value) {}),
                  ),
                  const Text(TText.rememberMe),
                ],
              ),

              // forget password

              TextButton(
                  onPressed: (() {
                    Get.to(() => const ForgetPassword());
                  }),
                  child: const Text(TText.forgetPassword))
            ],
          ),

          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          // Sign In Button

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const NavigationMenu());
                },
                child: const Text(
                  TText.signIn,
                )),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          // Create Account Button

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const SignUpScreen());
                },
                child: const Text(
                  TText.createAccount,
                )),
          ),
        ],
      )),
    );
  }
}
