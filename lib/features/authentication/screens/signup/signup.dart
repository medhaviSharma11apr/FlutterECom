import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/login_signup/form_divider.dart';
import 'package:flutterstore/common/widgets/login_signup/social_button.dart';
import 'package:flutterstore/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            TSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Text(
                TText.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TSignUpform(dark: dark),

              // Divider
              TFormDivider(
                dark: dark,
                dividerText: TText.orSignInWith.toUpperCase(),
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              const TSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
