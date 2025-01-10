import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/texts/section_heading.dart';
import 'package:flutterstore/utils/constanats/colors.dart';

import '../../../../../utils/constanats/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: "Shipping Address",
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text(
          'Medhavi DM',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: TColors.grey,
              size: 16,
            ),
            Text(
              '+91-9910154572',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: TColors.grey,
              size: 16,
            ),
            Text(
              '13th Street. 47 W 13th St, New York, NY 10011, USA',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
          ],
        ),
      ],
    );
  }
}
