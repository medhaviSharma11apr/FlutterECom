import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterstore/utils/constanats/colors.dart';

class RatingBarIndicators extends StatelessWidget {
  const RatingBarIndicators({
    Key? key, required this.rating,
  }) : super(key: key);
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 20,
        unratedColor: TColors.grey,
        itemBuilder: (_, __) => const Icon(
              Icons.star,
              color: TColors.primaryColor,
            ));
  }
}
