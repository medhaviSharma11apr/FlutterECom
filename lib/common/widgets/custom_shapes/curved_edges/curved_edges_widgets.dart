import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({
    Key? key,
    this.child,
  }) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TCustomCurvedEdges(), child: child);
  }
}
