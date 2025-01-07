import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/images/t_circular_image.dart';
import 'package:flutterstore/features/personalization/screens/profile/profile.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:get/get.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    Key? key,
    required this.dark,
  }) : super(key: key);

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircularImage(
        dark: dark,
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Medhavi D',
        style: Theme.of(context).textTheme.headlineSmall!.apply(
              color: TColors.white,
            ),
      ),
      subtitle: Text('medhaviSharma11apr@gmail.com',
          style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: Colors.white,
              )),
      trailing: IconButton(
          onPressed: (() => Get.to(() => const ProfileScreen())),
          icon: const Icon(
            Icons.edit,
            color: Colors.white,
          )),
    );
  }
}
