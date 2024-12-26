import 'package:flutter/material.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({
    Key? key,
    required this.dark,
  }) : super(key: key);

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: true,
            onChanged: ((value) {}),
          ),
        ),
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
