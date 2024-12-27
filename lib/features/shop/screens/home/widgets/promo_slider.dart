import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/images/t_rounded_images.dart';
import 'package:flutterstore/features/shop/controller/home_controller.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    Key? key, required this.banners,
  }) : super(key: key);
  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          CarouselSlider(
            items: banners.map((url) => TRoundedImage(imageUrl: url)).toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) {
                controller.updatePageIndicator(index);
              },
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Center(
            child: Obx((() => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < banners.length; i++)
                      TCircularContainer(
                        margin: const EdgeInsets.only(right: 10),
                        width: 15,
                        height: 4,
                        backgroundcColor:
                            controller.carouselCurrentIndex.value == i
                                ? TColors.primaryColor
                                : TColors.grey,
                      ),
                  ],
                ))),
          )
        ],
      ),
    );
  }
}
