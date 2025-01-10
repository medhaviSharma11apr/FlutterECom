import 'package:flutter/material.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';
import 'package:flutterstore/utils/popups/loaders.dart';
import 'package:get/get.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    Future<bool> pop() async {
      return false;
    }

    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: ((context) => WillPopScope(
              onWillPop: (() => pop()),
              child: Container(
                color: THelperFunctions.isDarkMode(context)
                    ? TColors.dark
                    : TColors.white,
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 230,
                      ),
                      AnimationLoaderWidget(text: text, animation: animation),
                    ],
                  ),
                ),
              ),
            )));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
