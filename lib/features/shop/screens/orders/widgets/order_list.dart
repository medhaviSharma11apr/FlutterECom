import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          showBorder: true,
          backgroundColor: dark ? TColors.dark : TColors.light,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // row 1
              Row(
                children: [
                  // Icon
                  const Icon(Icons.online_prediction_rounded),
                  const SizedBox(
                    width: TSizes.spaceBtwItems / 2,
                  ),

                  // status nd date
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Processing",
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: TColors.primaryColor,
                                fontWeightDelta: 1,
                              ),
                        ),
                        Text(
                          "02 Nov 2024",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: (() {}),
                      icon: const Icon(
                        Icons.arrow_right,
                        size: TSizes.iconMd,
                      ))
                ],
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              // row 2

              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        // Icon
                        const Icon(Icons.foggy),
                        const SizedBox(
                          width: TSizes.spaceBtwItems / 2,
                        ),

                        // status nd date
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Order",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                "[#42156]",
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        // Icon
                        const Icon(Icons.calendar_month),
                        const SizedBox(
                          width: TSizes.spaceBtwItems / 2,
                        ),

                        // status nd date
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Order",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                "03 Feb 2025",
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      itemCount: 5,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: TSizes.spaceBtwItems,
        );
      },
    );
  }
}
