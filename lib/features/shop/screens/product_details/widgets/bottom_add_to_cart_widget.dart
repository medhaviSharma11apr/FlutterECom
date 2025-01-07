import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/icons/circular_icon.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
              TSizes.cardRadiusLg,
            ),
            topRight: Radius.circular(
              TSizes.cardRadiusLg,
            ),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon(
                icon: Icons.remove,
                width: 40,
                height: 40,
                backgroundColor: TColors.darkGrey,
                color: TColors.white,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              const TCircularIcon(
                icon: Icons.add,
                width: 40,
                height: 40,
                backgroundColor: Colors.black,
                color: TColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: (() {}),
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: Colors.black,
                side: const BorderSide(color: Colors.black)),
            child: const Text("Add To Cart"),
          )
        ],
      ),
    );
  }
}
