import 'package:flutter/material.dart';
import 'package:flutterstore/features/shop/screens/home/home.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        (() => NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.selectedIndex.value = index,
              backgroundColor: darkMode ? TColors.black : TColors.white,
              surfaceTintColor: darkMode
                  ? TColors.white.withOpacity(0.1)
                  : TColors.black.withOpacity(0.1),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.shop),
                  label: 'Shop',
                ),
                NavigationDestination(
                  icon: Icon(Icons.favorite),
                  label: 'Wishlist',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            )),
      ),
      body: Obx(
        (() => controller.screens[controller.selectedIndex.value]),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
}
