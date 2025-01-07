import 'package:flutter/material.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Rating
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: '5.0',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const TextSpan(
                text: '(199)',
                // style: Theme.of(context).textTheme.bodyLarge,
              ),
            ]))
          ],
        ),

        // Share Button

        IconButton(
            onPressed: (() {}),
            icon: const Icon(
              Icons.share,
              size: TSizes.iconMd,
            ))
      ],
    );
  }
}
