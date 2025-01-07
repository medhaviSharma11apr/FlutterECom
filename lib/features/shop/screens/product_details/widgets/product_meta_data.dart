import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutterstore/common/widgets/images/t_circular_image.dart';
import 'package:flutterstore/common/widgets/products/product_card/product_price_text.dart';
import 'package:flutterstore/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:flutterstore/common/widgets/texts/product_title_text.dart';
import 'package:flutterstore/utils/constanats/enums.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';
import '../../../../../utils/constanats/colors.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price and sale Price

        Row(
          children: [
            /// sale tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.sm,
                vertical: TSizes.xs,
              ),
              child: Text(
                '25%',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: Colors.black,
                    ),
              ),
            ),

            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),

            /// price
            Text(
              '\$250',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                    decoration: TextDecoration.lineThrough,
                  ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            const ProductPrice(price: '175')
          ],
        ),

        const SizedBox(
          width: TSizes.spaceBtwItems / 1.5,
        ),

        //Title
        const ProductTitleText(title: "Green Nike Sports Shirt"),
        const SizedBox(
          width: TSizes.spaceBtwItems / 1.5,
        ),

        //Stack status
        Row(
          children: [
            const ProductTitleText(title: "Status"),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              "In Stock",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        const SizedBox(
          width: TSizes.spaceBtwItems / 1.5,
        ),

        // Brand

        Row(
          children: [
            CircularImage(
              dark: dark,
              image: TImages.cosmeticIcon,
              width: 32,
              height: 32,
              overlaycolor: dark ? TColors.white : TColors.black,
            ),
            const SizedBox(
              width: 200,
              child: BrandTitleWidgetWithVerifiedIcon(
                title: 'Nike',
                brandTextSizes: TextSizes.medium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
