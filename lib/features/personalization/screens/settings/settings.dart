import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/appbar/appbar.dart';
import 'package:flutterstore/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutterstore/common/widgets/list_tile/setting_menu_tile.dart';
import 'package:flutterstore/common/widgets/list_tile/user_profile_tile.dart';
import 'package:flutterstore/common/widgets/texts/section_heading.dart';
import 'package:flutterstore/features/personalization/screens/address/addresses.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-- Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // User Profile Card
                  UserProfileTile(
                    dark: dark,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            ),
            //--Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // -- Account Setting
                  const TSectionHeading(
                    title: 'Account Setting ',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  SettingMenuTile(
                    icon: Icons.home_sharp,
                    title: 'My Adress',
                    subtitle: 'Set Shopping Delivery Address',
                    onTap: () => Get.to(const UserAddressScreen()),
                  ),
                  const SettingMenuTile(
                    icon: Icons.shopping_basket,
                    title: 'My Cart',
                    subtitle: 'Add , remove product and move to checkout',
                  ),

                  const SettingMenuTile(
                    icon: Icons.shopify_sharp,
                    title: 'My Orders',
                    subtitle: 'In Progress and Completed Orders',
                  ),

                  const SettingMenuTile(
                    icon: Icons.money,
                    title: 'Bank Account',
                    subtitle: 'Withdraw balance to register bank account',
                  ),
                  const SettingMenuTile(
                    icon: Icons.discount,
                    title: 'My Coupons',
                    subtitle: 'List of all discounted coupons',
                  ),
                  const SettingMenuTile(
                    icon: Icons.notification_add,
                    title: 'Notifications',
                    subtitle: 'Set Any kind of notifications messages',
                  ),
                  const SettingMenuTile(
                    icon: Icons.security_outlined,
                    title: 'Account Privacy',
                    subtitle: 'Manage Data Usage and connected accounts',
                  ),
                  // App Setting

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: 'App Setting',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const SettingMenuTile(
                    icon: Icons.document_scanner,
                    title: "Upload Data",
                    subtitle: 'Upload Data To Your Cloud FireBase',
                  ),
                  SettingMenuTile(
                    icon: Icons.location_on,
                    title: "GeoLocation",
                    subtitle: 'Set Recommendation Based on Location',
                    trailing: Switch(value: true, onChanged: ((value) {})),
                  ),
                  SettingMenuTile(
                    icon: Icons.security_rounded,
                    title: "Safe Mode",
                    subtitle: 'Search Result Is Safe For all Users',
                    trailing: Switch(value: true, onChanged: ((value) {})),
                  ),
                  SettingMenuTile(
                    icon: Icons.image,
                    title: "HD Quality Image",
                    subtitle: 'Set Image Quality to be seen',
                    trailing: Switch(value: false, onChanged: ((value) {})),
                  ),
                  // -- LogOut Button

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Log Out'),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
