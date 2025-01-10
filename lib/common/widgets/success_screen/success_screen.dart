import 'package:flutter/material.dart';
import 'package:flutterstore/common/style/spacing_style.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              // Images
              Lottie.asset(image,
                  width: MediaQuery.of(context).size.width * 0.6),
              //
              // Image(
              //   image: AssetImage(image),
              //   width: THelperFunctions.screenWidth() * 0.6,
              // ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // Title and SubTitle
              //
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //   PP
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed, child: const Text(TText.tContinue)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
