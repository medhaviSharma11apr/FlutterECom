import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/images/t_rounded_images.dart';
import 'package:flutterstore/common/widgets/texts/product_title_text.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';

import '../../texts/brand_title_text_with_verified_icon.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        // Title price and sizes

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleWidgetWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child: ProductTitleText(
                  title: "Black Sports Nike Shoes",
                  maxline: 1,
                ),
              ),
              // Atribute

              Text.rich(TextSpan(children: [
                TextSpan(
                  text: 'Color',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: 'Green',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextSpan(
                  text: 'Size',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: 'UK 08',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
