import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/appbar/appbar.dart';
import 'package:flutterstore/common/widgets/products/rating/rating_indicator.dart';
import 'package:flutterstore/features/shop/screens/product_review/widgtes/user_review_card.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'widgtes/rating_progress_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Reviews & Ratings'),
      ),
      // Body
      body: SingleChildScrollView(
        // single child scroll view

        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Rating and reviews are verified and are from people who use the same type of device that you use. "),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              // OverAll Product Ratings
              const OverAllProductRating(),
              // Rating
              const RatingBarIndicators(
                rating: 3.5,
              ),
              Text(
                '12,116',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
