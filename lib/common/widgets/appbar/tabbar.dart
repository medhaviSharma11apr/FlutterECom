import 'package:flutter/material.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/device/device_utils.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';

class TabBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const TabBarCustom({super.key, required this.tabs});
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
        color: dark ? Colors.black : Colors.white,
        child: TabBar(
          isScrollable: true,
          indicatorColor: TColors.primaryColor,
          labelColor: dark ? Colors.white : TColors.primaryColor,
          unselectedLabelColor: TColors.darkGrey,
          tabs: tabs,
        ));
  }

  @override
// TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
