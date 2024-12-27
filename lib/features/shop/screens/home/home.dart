import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutterstore/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutterstore/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutterstore/common/widgets/images/t_rounded_images.dart';
import 'package:flutterstore/common/widgets/texts/section_heading.dart';
import 'package:flutterstore/features/shop/screens/home/widgets/home_categories.dart';
import 'package:flutterstore/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import '../../../../utils/constanats/image_string.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // --AppBar--
                  const THomeAppBar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // --SearchBar--

                  const TSearchContainer(
                    icon: Icons.search,
                    text: 'Search in Store',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  // --Categories

                  Padding(
                    padding: const EdgeInsets.only(
                      left: TSizes.defaultSpace,
                    ),
                    child: Column(
                      children: const [
                        // Heading
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: TColors.white,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                        // Categories
                        THomeCategories()
                      ],
                    ),
                  )
                ],
              ),
            ),

            // Body
            const TPromoSlider(
              banners: [
                TImages.promoBanner1,
                TImages.promoBanner2,
                TImages.promoBanner3,
                TImages.promoBanner4,
                TImages.promoBanner5,
                TImages.promoBanner6,
                TImages.promoBanner7,
                TImages.promoBanner8,
              ],
            )
          ],
        ),
      ),
    );
  }
}
