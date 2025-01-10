import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterstore/common/widgets/appbar/appbar.dart';
import 'package:flutterstore/utils/constanats/sizes.dart';

import 'widgets/order_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: TAppBar(
        title: Text(
          "My Orders",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      body: const Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      // Orders
      child: OrderList(),
      ),
    );
  }
}
