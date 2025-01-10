import 'package:flutter/material.dart';
import 'package:flutterstore/features/authentication/controller/onboarding/onboarding_controller.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';

import 'package:flutterstore/utils/device/device_utils.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';

class OnBoardingCircularButton extends StatelessWidget {
  const OnBoardingCircularButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;
    return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight() * 0.8,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: dark ? TColors.primaryColor : Colors.black),
          onPressed: (() {
            controller.nextPage();
            // OnBoardingController.instance.nextPage;
          }),
          // child: const Icon(Iconsax.arrow_right_3),
          // child: const Icon(Iconsax.activity),
          child: const Icon(Icons.arrow_forward_ios),
          // child: const Text('next'),
        ));
  }
}
