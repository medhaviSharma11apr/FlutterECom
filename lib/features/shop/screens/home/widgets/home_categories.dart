import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';

import '../../../../../utils/constanats/colors.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      TImages.sportsIcon,
      TImages.clothIcon,
      TImages.shoeIcon,
      TImages.cosmeticIcon,
      TImages.animalIcon,
      TImages.toyIcon,
      TImages.furnitureIcon,
      TImages.jewelryIcon,
      TImages.electronicIcon,
    ];
    final List<String> nameList = [
      'Sports',
      'Clothes',
      'Shoes',
      'Cosmetics',
      'Animals Products',
      'Toys',
      'Furniture',
      'Jewellery',
      'Electronics'
    ];
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return TverticalImageText(
            image: imageList[index],
            title: nameList[index],
            textColor: TColors.white,
            backgroundColor: TColors.white,
            onTap: () {},
          );
        },
      ),
    );
  }
}
