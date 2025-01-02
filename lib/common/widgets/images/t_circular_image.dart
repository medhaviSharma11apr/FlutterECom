import 'package:flutter/material.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    Key? key,
    required this.dark,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlaycolor,
    this.backgroundcolor,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
  }) : super(key: key);
  final bool dark;
  final BoxFit fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlaycolor;
  final Color? backgroundcolor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color:backgroundcolor?? (dark ? Colors.black : Colors.white),
          borderRadius: BorderRadius.circular(100)),
      child: Image(
        image: isNetworkImage?NetworkImage(image): AssetImage(image) as ImageProvider,
        color: overlaycolor,
      ),
    );
  }
}
