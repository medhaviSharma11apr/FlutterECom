import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/brands/brand_card.dart';
import 'package:flutterstore/common/widgets/custom_shapes/containers/rounded_container.dart';

import '../../../utils/constanats/colors.dart';
import '../../../utils/constanats/sizes.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    Key? key,
    required this.dark,
    required this.images,
  }) : super(key: key);

  final bool dark;
  final List<String> images;

  Widget brandTopProductImagesWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        height: 100,
        backgroundColor: dark ? TColors.darkerGrey : TColors.light,
        child: Image(fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          // Brand With Product Count
          BrandCard(
            dark: dark,
            showBorder: false,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          // Brand Top 3 Product Image
          Row(
              children: images
                  .map((image) => brandTopProductImagesWidget(image, context))
                  .toList()),
        ],
      ),
    );
  }
}
