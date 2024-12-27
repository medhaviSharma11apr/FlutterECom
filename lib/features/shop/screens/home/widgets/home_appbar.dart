import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/appbar/appbar.dart';
import 'package:flutterstore/common/widgets/product_cart/cart_menu_icon.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        children: [
          Text(
            TText.homeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Text(
            TText.homeAppBarSubTitle,
            style: Theme.of(context).textTheme.labelSmall!.apply(
                  color: TColors.white,
                ),
          ),
        ],
      ),
      actions: [
        TCartCounterIcon(
          onPressed: (() {}),
          iconColor: TColors.white,
        )
      ],
    );
  }
}
