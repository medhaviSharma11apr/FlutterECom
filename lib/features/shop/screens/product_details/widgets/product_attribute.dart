import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/chips/choice_chip.dart';
import 'package:flutterstore/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutterstore/common/widgets/products/product_card/product_price_text.dart';
import 'package:flutterstore/common/widgets/texts/product_title_text.dart';
import 'package:flutterstore/common/widgets/texts/section_heading.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // Selecting Attribute Pricing & description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              // Title , price and stock status
              Row(
                children: [
                  const TSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                            title: "Price :",
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),

                          // Actual Price
                          Text(
                            '\$25',
                            style:
                                Theme.of(context).textTheme.titleSmall!.apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),

                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          // Sale Price

                          const ProductPrice(price: '20'),
                        ],
                      ),

                      // Stock

                      Row(
                        children: [
                          const ProductTitleText(
                            title: "Stock :",
                            smallSize: true,
                          ),
                          Text(
                            "   In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              // Variation Description

              const ProductTitleText(
                title:
                    'Thsis is product description and it will go max upto 4 lines ',
                smallSize: true,
                maxline: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        // -- Attributes
        Column(
          children: [
            const TSectionHeading(title: 'Colors'),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                  text: "Blue",
                  selected: true,
                  onSelected: (p0) {},
                ),
                CustomChoiceChip(
                  text: "Green",
                  selected: false,
                  onSelected: (p0) {},
                ),
                CustomChoiceChip(
                  text: "Yellow",
                  selected: false,
                  onSelected: (p0) {},
                ),
              ],
            ),
          ],
        ),
        Column(
         
          children: [
            const TSectionHeading(
              title: 'Sizes',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                  text: "EU 34",
                  selected: true,
                  onSelected: (p0) {},
                ),
                CustomChoiceChip(
                  text: "EU 36",
                  selected: false,
                  onSelected: (p0) {},
                ),
                CustomChoiceChip(
                  text: "EU 38",
                  selected: false,
                  onSelected: (p0) {},
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
