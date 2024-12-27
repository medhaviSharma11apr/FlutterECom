import 'package:flutter/material.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';

class TverticalImageText extends StatelessWidget {
  const TverticalImageText({
    Key? key,
    required this.image,
    required this.title,
    required this.textColor,
    this.backgroundColor,
    this.onTap,
  }) : super(key: key);

  final String image;
  final String title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          right: TSizes.spaceBtwItems,
        ),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor ??
                      (THelperFunctions.isDarkMode(context)
                          ? TColors.black
                          : TColors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                  height: 56,
                  width: 56,
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  // color: THelperFunctions.isDarkMode(context)
                  //     ? TColors.light
                  //     : TColors.dark,
                ),
              ),
            ),

            //Text

            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            SizedBox(
              width: 55,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
