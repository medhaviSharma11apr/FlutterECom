import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/appbar/appbar.dart';
import 'package:flutterstore/common/widgets/images/t_rounded_images.dart';
import 'package:flutterstore/common/widgets/texts/section_heading.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';

import '../../../../common/widgets/products/product_card/product_card_horizontal.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TAppBar(
          title: Text("Sport Shirts"),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Banner

              const TRoundedImage(
                imageUrl: TImages.promoBanner4,
                width: double.infinity,
                height: null,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Sub- categories

              Column(
                children: [
                  // Heading

                  TSectionHeading(
                    title: 'Sport Shirt',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return const ProductHorizontalCard();
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: TSizes.spaceBtwItems,
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
