import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';

import '../../../../utils/constanats/colors.dart';
import 'circular_container.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.primaryColor,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            // Background Custom Shape
            children: [
              Positioned(
                top: -50,
                right: -250,
                child: TCircularContainer(
                  // backgroundcColor: TColors.textWhite.withOpacity(0.1),
                  backgroundcColor: TColors.white.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundcColor: TColors.white.withOpacity(0.1),
                ),
              ),
              child
              // Positioned(
              //   top: 0,
              //   child: child,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
