import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/products/cart/add_remove_button.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';

import '../../../../../common/widgets/products/cart/cart_menu_item.dart';
import '../../../../../common/widgets/products/product_card/product_price_text.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    Key? key,
    this.showaddremovebuttons = true,
  }) : super(key: key);

  final bool showaddremovebuttons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: ((context, index) {
        return const SizedBox(
          height: TSizes.spaceBtwSections,
        );
      }),
      itemCount: 4,
      itemBuilder: ((context, index) {
        return Column(
          children: [
            const CartItem(),
            if (showaddremovebuttons)
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            if (showaddremovebuttons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      // Extra space
                      SizedBox(
                        width: 70,
                      ),
                      // Add and Remove button
                      ProductQuantityWithAddAndRemove(),
                    ],
                  ),

                  // price
                  const ProductPrice(price: '256'),
                ],
              )
          ],
        );
      }),
    );
  }
}
