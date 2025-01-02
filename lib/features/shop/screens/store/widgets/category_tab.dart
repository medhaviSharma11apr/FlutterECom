import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/brands/brand_show_case.dart';
import 'package:flutterstore/common/widgets/layouts/grid_layout.dart';
import 'package:flutterstore/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:flutterstore/common/widgets/texts/section_heading.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    Key? key,
    required this.dark,
  }) : super(key: key);

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // Brands
                BrandShowCase(
                  dark: dark,
                  images: const [
                    TImages.productImage1,
                    TImages.productImage2,
                    TImages.productImage3,
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                // Products

                TSectionHeading(
                  title: "You Might Like",
                  showActionButton: true,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                //

                GridLayout(
                    itemCount: 4,
                    itemBuilder: ((p0, p1) {
                      return ProductVerticalCard(
                          imageUrl: TImages.productImage1);
                    })),

                const SizedBox(
                  height: TSizes.spaceBtwSections,
                )
              ],
            ),
          ),
        ]);
  }
}
