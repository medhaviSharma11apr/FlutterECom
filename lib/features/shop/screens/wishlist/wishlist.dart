import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/appbar/appbar.dart';
import 'package:flutterstore/common/widgets/icons/circular_icon.dart';
import 'package:flutterstore/common/widgets/layouts/grid_layout.dart';
import 'package:flutterstore/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:flutterstore/features/shop/screens/home/home.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:get/get.dart';

import '../../../../utils/constanats/sizes.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'WishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Icons.add,
            onPressed: () {
              Get.to(const HomeScreen());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              GridLayout(
                  itemCount: 6,
                  itemBuilder: ((p0, p1) {
                    return ProductVerticalCard(
                        imageUrl: TImages.productImage10);
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
