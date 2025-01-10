import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutterstore/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  // Variables
  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;
  // Update curretnt Index When Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;
  // jump to specific dot selected Page.
  void dotNavigationClick(index) {
    log('dotNavigation');
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Update Current Index an jump to next page
  void nextPage() {
    log('valuecyvy');
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update Current Index an jump to last page
  void skipPAge() {
    log('valueSkip');
    currentPageIndex.value = 2;
    log(currentPageIndex.value.toString());
    pageController.jumpToPage(2);
  }
}
