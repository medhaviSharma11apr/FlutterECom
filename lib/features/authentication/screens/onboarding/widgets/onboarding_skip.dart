import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterstore/features/authentication/controller/onboarding/onboarding_controller.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/device/device_utils.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        child: const Text("Skip"),
        onPressed: () {
          log('vegv');
          controller.skipPAge();
        },
      ),
    );
  }
}
