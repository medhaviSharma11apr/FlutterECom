import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    Key? key,
    this.currency = '\$',
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.linerthrough = false,
  }) : super(key: key);

  final String currency, price;
  final int maxLines;
  final bool isLarge;
  final bool linerthrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currency + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: linerthrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: linerthrough ? TextDecoration.lineThrough : null),
    );
  }
}
