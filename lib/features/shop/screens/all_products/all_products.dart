import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/appbar/appbar.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';

import '../../../../common/widgets/products/sortable/sortable_product.dart';

class AllProdcts extends StatelessWidget {
  const AllProdcts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Popular Products',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: SortableWidget.SortableProducts(),
        ),
      ),
    );
  }
}
