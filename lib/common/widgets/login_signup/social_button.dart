import 'package:flutter/material.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: (() {}),
              icon: const Image(
                  width: TSizes.iconMd,
                  height: TSizes.iconMd,
                  image: AssetImage(
                    TImages.google,
                  ))),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: (() {}),
              icon: const Image(
                  width: TSizes.iconMd,
                  height: TSizes.iconMd,
                  image: AssetImage(
                    TImages.facebook,
                  ))),
        ),
      ],
    );
  }
}
