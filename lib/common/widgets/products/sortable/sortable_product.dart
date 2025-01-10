import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/layouts/grid_layout.dart';
import 'package:flutterstore/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';

import '../../../../utils/constanats/image_string.dart';

class SortableWidget extends StatelessWidget {
  const SortableWidget.SortableProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Drop Down
        DropdownButtonFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.sort),
          ),
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
          onChanged: ((value) {}),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        /// products
        GridLayout(
            itemCount: 8,
            itemBuilder: ((p0, p1) =>
                ProductVerticalCard(imageUrl: TImages.productImage14)))
      ],
    );
  }
}
