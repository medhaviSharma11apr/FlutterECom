import 'package:flutter/material.dart';
import 'package:flutterstore/utils/constanats/colors.dart';

class TCircularContainer extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final double padding;
  final EdgeInsets margin;
  final Widget? child;
  final Color backgroundcColor;
  const TCircularContainer({
    Key? key,
    this.height = 400,
    this.width = 400,
    this.radius = 400,
    this.padding = 0,
    this.margin = const EdgeInsets.all(0),
    this.child,
    this.backgroundcColor = TColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundcColor,
      ),
    );
  }
}
