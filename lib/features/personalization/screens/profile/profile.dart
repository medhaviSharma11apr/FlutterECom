import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/appbar/appbar.dart';
import 'package:flutterstore/common/widgets/images/t_circular_image.dart';
import 'package:flutterstore/common/widgets/texts/section_heading.dart';
import 'package:flutterstore/features/personalization/controller/user_controller.dart';
import 'package:flutterstore/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';
import 'package:get/get.dart';

import 'widgets/change_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      /// -- AppBar
      appBar: const TAppBar(
        title: Text('Profile'),
        actions: [],
        showBackArrow: true,
      ),
      //// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Profile  Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircularImage(
                      dark: dark,
                      image: TImages.user,
                      height: 80,
                      width: 80,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              // Details

              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(title: 'Profile Information'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              // Row

              ProfileMenu(
                value: controller.userModel.value.fullName,
                onPressed: () {
                  Get.to(() => ChangeName());
                },
                title: 'Name',
              ),
              ProfileMenu(
                value: controller.userModel.value.email,
                onPressed: () {},
                title: 'User Name',
              ),
              // Spacer

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              // Heading Personal Information
              const TSectionHeading(
                title: "Personal Information",
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              // moreInfo
              ProfileMenu(
                value: controller.userModel.value.userName,
                onPressed: () {},
                title: 'User Name',
              ),
              ProfileMenu(
                value: controller.userModel.value.id,
                onPressed: () {},
                title: 'User Id',
                icon: Icons.copy,
              ),
              ProfileMenu(
                value: controller.userModel.value.email,
                onPressed: () {},
                title: 'Email',
              ),
              ProfileMenu(
                value: controller.userModel.value.phoneNumber,
                onPressed: () {},
                title: 'Phone Number',
              ),
              ProfileMenu(
                value: 'Female',
                onPressed: () {},
                title: 'Gender',
              ),
              ProfileMenu(
                value: '11 Apr 1997',
                onPressed: () {},
                title: 'Date of Birth',
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              Center(
                child: TextButton(
                  onPressed: () {
                    controller.deleteAccountWarningPopup();
                  },
                  child: const Text(
                    'Close Account ',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
