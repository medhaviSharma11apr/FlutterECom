import 'package:flutter/material.dart';
import 'package:flutterstore/features/personalization/controller/user_controller.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:flutterstore/utils/validators/validation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Re-Authenticate User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: Validator.validateEmail,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.fork_right),
                    labelText: TText.email,
                  ),
                ),

                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                // PassWord

                Obx((() => TextFormField(
                      controller: controller.verifyPassword,
                      obscureText: controller.hidePassword.value,
                      validator: (value) =>
                          Validator.validateEmptyText("Password", value),
                      decoration: InputDecoration(
                          labelText: TText.password,
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: IconButton(
                              onPressed: (() {
                                controller.hidePassword.value =
                                    !controller.hidePassword.value;
                              }),
                              icon: const Icon(Icons.visibility))),
                    ))),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (() => controller.reAuthenticateEmailAndPasswordUser()), child: const Text('Verify')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
