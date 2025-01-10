import 'package:flutter/material.dart';
import 'package:flutterstore/features/authentication/controller/signup/signup_contoller.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({
    Key? key,
    required this.dark,
  }) : super(key: key);

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        Obx((() => SizedBox(
              height: 24,
              width: 24,
              child: Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: ((value) {
                  controller.privacyPolicy.value =
                      !controller.privacyPolicy.value;
                }),
              ),
            ))),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: "${TText.iAgreeTo} ",
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: "${TText.privacyPolicy} ",
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primaryColor,
                  decoration: TextDecoration.underline)),
          TextSpan(
              text: "${TText.and} ",
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: "${TText.termsOfUse} ",
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primaryColor,
                    decoration: TextDecoration.underline,
                  )),
        ]))
      ],
    );
  }
}
