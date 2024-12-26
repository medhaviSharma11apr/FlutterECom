import 'package:flutter/material.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/constanats/text_string.dart';

class TLoginHeader extends StatelessWidget {
  bool dark;
  TLoginHeader({
    super.key,
    required this.dark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image(
            height: 150,
            image: AssetImage(
              dark ? TImages.lightAppLogo : TImages.darkAppLogo,
            ),
          ),
          Text(
            TText.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: TSizes.sm,
          ),
          Text(
            TText.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
