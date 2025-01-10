import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/appbar/appbar.dart';
import 'package:flutterstore/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutterstore/common/widgets/products/cart/coupon_widget.dart';
import 'package:flutterstore/common/widgets/success_screen/success_screen.dart';
import 'package:flutterstore/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:flutterstore/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:flutterstore/navigation_menu.dart';
import 'package:flutterstore/utils/constanats/colors.dart';
import 'package:flutterstore/utils/constanats/image_string.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';
import 'package:get/get.dart';

import 'widgets/billing_address_section.dart';
import 'widgets/billing_amount_section.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Items in cart
              const CartItems(
                showaddremovebuttons: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // Coupon textfield

              CouponCodeWidget(dark: dark),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: const [
                    // pricing
                    BillingTotalAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    )
                    // divider
                    ,
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    )
                    //payment method

                    ,
                    BillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    //address

                    BillingAddressSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          child: const Text('Checkout: \$234'),
          onPressed: () {
            Get.to(() => SuccessScreen(
                  image: TImages.successfulPaymentIcon,
                  title: "Payment Successful",
                  subtitle: 'Your Item Will Be Shipped Sooon',
                  onPressed: () => Get.offAll(const NavigationMenu()),
                ));
          },
        ),
      ),
    );
  }
}
