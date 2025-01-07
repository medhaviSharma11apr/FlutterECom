import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/appbar/appbar.dart';
import 'package:flutterstore/common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:flutterstore/common/widgets/images/t_rounded_images.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';

import '../../../../../common/widgets/icons/circular_icon.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    Key? key,
   
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
      final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        decoration:
            BoxDecoration(color: dark ? TColors.darkGrey : TColors.light),
        child: Stack(
          children: [
            // Main Large Image
            const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(
                    child: Image(
                      image: AssetImage(TImages.productImage5),
                    ),
                  ),
                )),

            // Image Slider
            Positioned(
              left: TSizes.defaultSpace,
              right: 0,
              bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 8,
                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      width: TSizes.spaceBtwItems,
                    );
                  },
                  itemBuilder: (_, index) {
                    return TRoundedImage(
                      width: 80,
                      height: 80,
                      border: Border.all(color: TColors.primaryColor),
                      padding: const EdgeInsets.all(TSizes.sm),
                      backgroundColor: dark ? TColors.dark : TColors.white,
                      imageUrl: TImages.productImage5,
                    );
                  },
                ),
              ),
            ),

            // AppBar Icon

            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(
                  icon: Icons.favorite,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
