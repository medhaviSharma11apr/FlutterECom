import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/appbar/appbar.dart';
import 'package:flutterstore/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutterstore/utils/constanats/colors.dart';

import '../../../../../utils/constanats/text_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Column(
                      children: [
                        Text(
                          TText.homeAppBarTitle,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: TColors.grey),
                        ),
                        Text(
                          TText.homeAppBarSubTitle,
                          style: Theme.of(context).textTheme.labelSmall!.apply(
                                color: TColors.white,
                              ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
