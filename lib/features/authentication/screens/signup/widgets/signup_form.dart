import 'package:flutter/material.dart';
import 'package:flutterstore/features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:flutterstore/utils/validators/validation.dart';
import 'package:get/get.dart';

import '../../../controller/signup/signup_contoller.dart';

class TSignUpform extends StatelessWidget {
  const TSignUpform({
    Key? key,
    required this.dark,
  }) : super(key: key);

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      Validator.validateEmptyText('First Name', value),
                  controller: controller.firstName,
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TText.firstName,
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: TSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      Validator.validateEmptyText('Last Name', value),
                  controller: controller.lastName,
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TText.lastName,
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          // UserName

          TextFormField(
            validator: (value) =>
                Validator.validateEmptyText('User Name', value),
            controller: controller.userName,
            expands: false,
            decoration: InputDecoration(
              labelText: TText.username,
              prefixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(),
              ),
            ),
          ),

          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          // Emaill
          TextFormField(
            validator: ((value) => Validator.validateEmail(value)),
            controller: controller.email,
            expands: false,
            decoration: InputDecoration(
              labelText: TText.email,
              prefixIcon: const Icon(
                Icons.email,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(),
              ),
            ),
          ),

          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          // Phone Number

          TextFormField(
            validator: (value) => Validator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            expands: false,
            decoration: InputDecoration(
              labelText: TText.phoneNo,
              prefixIcon: const Icon(
                Icons.phone,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(),
              ),
            ),
          ),

          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          // password

          Obx((() => TextFormField(
                validator: (value) => Validator.validatePassword(value),
                controller: controller.password,
                expands: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TText.password,
                  prefixIcon: const Icon(
                    Icons.password,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: (() => controller.hidePassword.value =
                        !controller.hidePassword.value),
                    child: controller.hidePassword.value
                        ? const Icon(
                            Icons.visibility,
                          )
                        : const Icon(
                            Icons.visibility_off,
                          ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(),
                  ),
                ),
              ))),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          // Terms and condition checkbox

          TermsAndCondition(dark: dark),

          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          // SignUp Button

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: (() {
                  controller.signUp();
                  // Get.to(() => const VerifyEmailScreen());
                }),
                child: const Text(TText.createAccount)),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
        ],
      ),
    );
  }
}
