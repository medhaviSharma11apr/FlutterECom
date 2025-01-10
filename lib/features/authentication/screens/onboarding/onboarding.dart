import 'package:flutter/material.dart';
import 'package:flutterstore/features/authentication/controller/onboarding/onboarding_controller.dart';
import 'package:flutterstore/features/authentication/screens/onboarding/widgets/onboarding_circular_button.dart';
import 'package:flutterstore/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:flutterstore/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:flutterstore/features/authentication/screens/onboarding/widgets/onboardingpage.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TText.onBoardingTitle1,
                subTitle: TText.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TText.onBoardingTitle2,
                subTitle: TText.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TText.onBoardingTitle3,
                subTitle: TText.onBoardingSubTitle3,
              ),
            ],
          ),
          // Skip Button
          const OnBoardingSkip(),
          // Dot Navigation SmoothPageIndicator
          const OnBoardingDotNAvigation(),

          // Circular Button
          const OnBoardingCircularButton()
        ],
      ),
    );
  }
}
