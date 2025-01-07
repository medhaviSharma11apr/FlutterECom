import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/texts/section_heading.dart';
import 'package:flutterstore/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:flutterstore/features/shop/screens/product_details/widgets/product_rating_share_widget.dart';
import 'package:flutterstore/features/shop/screens/product_review/product_review.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'widgets/bottom_add_to_cart_widget.dart';
import 'widgets/product_attribute.dart';
import 'widgets/product_meta_data.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Sliders

            const ProductImageSlider(),

            // Product Details

            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace,
                  left: TSizes.defaultSpace),
              child: Column(
                children: [
                  // Rating and share
                  const RatingAndShare(),

                  // Price Title stock and brand

                  const ProductMetaData(),

                  // Attribute
                  const ProductAttribute(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  // checkout Button

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (() {}), child: const Text('Checkout')),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  // Description

                  const TSectionHeading(
                    title: "Description",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    'There are multiple matches for large lines, including lines of longitude, long lines in topology, long lines in telecommunications, and long lines in poetry',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show More',
                    trimExpandedText: 'Show Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  //Reviews

                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        title: "Reviews(199)",
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: (() {
                          Get.to(() => const ProductReviewScreen());
                        }),
                        icon: const Icon(
                          Icons.arrow_right,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
