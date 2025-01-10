import 'package:flutter/material.dart';
import 'package:flutterstore/features/shop/screens/cart/cart.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:get/get.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    Key? key,
    required this.onPressed,
    required this.iconColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: (() => Get.to(() => const CartScreen())),
            icon: Icon(
              Icons.shopify,
              size: 34,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: TColors.white,
                      fontSizeFactor: 0.8,
                    ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
