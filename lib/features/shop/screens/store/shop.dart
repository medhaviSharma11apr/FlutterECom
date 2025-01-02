import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/appbar/appbar.dart';
import 'package:flutterstore/common/widgets/appbar/tabbar.dart';
import 'package:flutterstore/common/widgets/brands/brand_card.dart';
import 'package:flutterstore/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutterstore/common/widgets/layouts/grid_layout.dart';
import 'package:flutterstore/common/widgets/product_cart/cart_menu_icon.dart';
import 'package:flutterstore/common/widgets/texts/section_heading.dart';
import 'package:flutterstore/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(onPressed: (() {}), iconColor: Colors.black)
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                SliverAppBar(
                  expandedHeight: 440,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? Colors.black
                      : Colors.white,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(
                      TSizes.defaultSpace,
                    ),
                    child: ListView(
                      primary: false,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        // Search bar
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        const TSearchContainer(
                          text: 'Search in store ...',
                          showBorder: true,
                          showBackGround: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),

                        // Featured Brand

                        TSectionHeading(
                          title: "Featured Brand",
                          showActionButton: true,
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 1.5,
                        ),

                        // TRounded Container
                        GridLayout(
                            mainAxisExtent: 80,
                            itemCount: 4,
                            itemBuilder: ((p0, p1) {
                              return BrandCard(dark: dark);
                            }))
                      ],
                    ),
                  ),
                  // Tabs in AppBar
                  bottom: const TabBarCustom(tabs: [
                    Tab(
                      child: Text('Sports'),
                    ),
                    Tab(
                      child: Text('Furniture'),
                    ),
                    Tab(
                      child: Text('Electronics'),
                    ),
                    Tab(
                      child: Text('Clothes'),
                    ),
                    Tab(
                      child: Text('Cosmetics'),
                    )
                  ]),
                ),
              ]),
          // Body Container
          body: TabBarView(
            children: [
              CategoryTab(dark: dark),
              CategoryTab(dark: dark),
              CategoryTab(dark: dark),
              CategoryTab(dark: dark),
              CategoryTab(dark: dark),
            ],
          ),
        ),
      ),
    );
  }
}
