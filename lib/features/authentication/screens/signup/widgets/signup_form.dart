import 'package:flutter/material.dart';
import 'package:flutterstore/features/authentication/screens/signup/verify_email.dart';
import 'package:flutterstore/features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:get/get.dart';

class TSignUpform extends StatelessWidget {
  const TSignUpform({
    Key? key,
    required this.dark,
  }) : super(key: key);

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
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

          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: TText.password,
              prefixIcon: const Icon(
                Icons.password,
              ),
              suffixIcon: const Icon(
                Icons.visibility,
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
                  Get.to(() => const VerifyEmailScreen());
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
