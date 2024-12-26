import 'package:flutter/material.dart';
import 'package:flutterstore/common/style/spacing_style.dart';
import 'package:flutterstore/features/authentication/screens/login/widgets/login_form.dart';
import 'package:flutterstore/common/widgets/login_signup/form_divider.dart';
import 'package:flutterstore/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutterstore/common/widgets/login_signup/social_button.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo , Title and SubTitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Header
                  TLoginHeader(
                    dark: dark,
                  ),

                  // Next section is for Form

                  const TloginForm(),

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
              )
            ],
          ),
        ),
      ),
    );
  }
}
