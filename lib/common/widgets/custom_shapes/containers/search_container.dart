import 'package:flutter/material.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/device/device_utils.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    Key? key,
    required this.text,
    this.icon,
    this.showBackGround = true,
    this.showBorder = true,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final bool showBackGround, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding:  EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
            color: showBackGround
                ? dark
                    ? TColors.light
                    : TColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: TColors.grey) : null),
        child: Row(children: [
          Icon(
            icon,
            size: 30,
            color: TColors.darkGrey,
          ),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ]),
      ),
    );
  }
}
