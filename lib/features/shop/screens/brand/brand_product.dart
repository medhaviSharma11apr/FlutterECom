import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/appbar/appbar.dart';
import 'package:flutterstore/common/widgets/brands/brand_card.dart';
import 'package:flutterstore/common/widgets/products/sortable/sortable_product.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';

import '../../../../utils/constanats/sizes.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Nike"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              // brand details
              BrandCard(
                dark: dark,
                showBorder: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const SortableWidget.SortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
