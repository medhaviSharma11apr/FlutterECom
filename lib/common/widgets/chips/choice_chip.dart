import 'package:flutter/material.dart';
import 'package:flutterstore/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutterstore/utils/helpers/helper_function.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip(
      {super.key, this.onSelected, required this.text, required this.selected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) != null;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: ChoiceChip(
          label: isColor ? const SizedBox() : Text(text),
          selected: selected,
          onSelected: onSelected,
          labelStyle: TextStyle(
            color: selected ? Colors.white : null,
          ),
          avatar: isColor
              ? TCircularContainer(
                  width: 50,
                  height: 50,
                  backgroundcColor: THelperFunctions.getColor(text)!,
                )
              : null,
          shape: THelperFunctions.getColor(text) != null
              ? const CircleBorder()
              : null,
          labelPadding: THelperFunctions.getColor(text) != null
              ? const EdgeInsets.all(0)
              : null,
          padding: THelperFunctions.getColor(text) != null
              ? const EdgeInsets.all(0)
              : null,
          backgroundColor: THelperFunctions.getColor(text) != null
              ? THelperFunctions.getColor(text)!
              : null,
        ),
      ),
    );
  }
}
