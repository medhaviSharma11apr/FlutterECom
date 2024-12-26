import 'package:flutter/material.dart';
import 'package:flutterstore/features/authentication/controller/onboarding_controller.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/device/device_utils.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutterstore/utils/constanats/colors.dart';

class OnBoardingDotNAvigation extends StatelessWidget {
  const OnBoardingDotNAvigation({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() * 0.9,
      left: TSizes.defaultSpace,
      // left: MediaQuery.of(context).size.width * 0.45,
      child: SmoothPageIndicator(
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? TColors.light : TColors.dark,
          dotHeight: 6,
        ),
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
      ),
    );
  }
}
