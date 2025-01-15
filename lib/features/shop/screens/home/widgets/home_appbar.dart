import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/appbar/appbar.dart';
import 'package:flutterstore/common/widgets/product_cart/cart_menu_icon.dart';
import 'package:flutterstore/features/personalization/controller/user_controller.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';
import 'package:flutterstore/utils/popups/shimmer.dart';
import 'package:get/get.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
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
          Obx((() {
            if (!controller.profileLoading.value) {
              return Text(
                controller.userModel.value.fullName,
                style: Theme.of(context).textTheme.headlineSmall!.apply(
                      color: TColors.white,
                    ),
              );
            } else {
              return const CustomShimmer(
                width: 80,
                height: 15,
              );
            }
          })),
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
