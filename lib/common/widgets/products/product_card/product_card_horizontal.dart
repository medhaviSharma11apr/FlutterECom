import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutterstore/common/widgets/icons/circular_icon.dart';
import 'package:flutterstore/common/widgets/images/t_rounded_images.dart';
import 'package:flutterstore/common/widgets/products/product_card/product_price_text.dart';
import 'package:flutterstore/common/widgets/texts/product_title_text.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';

import '../../../../utils/constanats/colors.dart';
import '../../../../utils/constanats/sizes.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';

class ProductHorizontalCard extends StatelessWidget {
  const ProductHorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 380,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        // boxShadow: [ShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.softgrey,
      ),
      child: Row(
        children: [
          ///Thumbnail
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.white,
            child: Stack(
              children: [
                // -- thumbnail image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(
                    imageUrl: TImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                // sale tag
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.sm,
                      vertical: TSizes.xs,
                    ),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),

                // Favouriate icon

                const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      icon: Icons.favorite,
                      color: Colors.red,
                    )),
              ],
            ),
          )
          // Details
          ,
          SizedBox(
            width: 240,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.md),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      // title

                      ProductTitleText(
                        title: 'Green Nike Half Sleeves Shirt',
                        smallSize: true,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      SizedBox(
                          width: 200,
                          child:
                              BrandTitleWidgetWithVerifiedIcon(title: 'Nike')),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // pricing
                      const ProductPrice(price: '256.08 '),

                      // Add to cart

                      Container(
                        decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(TSizes.cardRadiusMd),
                                bottomRight: Radius.circular(
                                    TSizes.productImageRadius))),
                        child: const SizedBox(
                          height: TSizes.iconLg * 1.2,
                          width: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: TColors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
