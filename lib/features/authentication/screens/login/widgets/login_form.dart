import 'package:flutter/material.dart';
import 'package:flutterstore/features/authentication/controller/login/login_controller.dart';
import 'package:flutterstore/features/authentication/screens/password_congiguration/forget_password.dart';
import 'package:flutterstore/features/authentication/screens/signup/signup.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:flutterstore/utils/validators/validation.dart';
import 'package:get/get.dart';

class TloginForm extends StatelessWidget {
  const TloginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: TSizes.spaceBtwSections,
      ),
      child: Form(
          key: controller.loginFormKey,
          child: Column(
            children: [
              //Email Section
              TextFormField(
                validator: (value) => Validator.validateEmail(value),
                controller: controller.email,
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
              Obx(() => (TextFormField(
                    validator: (value) =>
                        Validator.validateEmptyText("Password", value),
                    controller: controller.password,
                    obscureText: controller.togglePasswordVisibility.value,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.pin,
                        ),
                        labelText: TText.password,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.togglePasswordVisibility.value =
                                !controller.togglePasswordVisibility.value;
                          },
                          child: Icon(
                            controller.togglePasswordVisibility.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        )),
                  ))),
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
                      Obx((() => Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                width: 2,
                                color: TColors.grey,
                              ),
                            ),
                            child: Checkbox(
                              value: controller.rememberme.value,
                              onChanged: ((value) {
                                controller.rememberme.value =
                                    !controller.rememberme.value;
                              }),
                            ),
                          ))),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
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
                      controller.emailAndPasswordSignIn();
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
