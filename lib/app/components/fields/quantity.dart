import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../themes/styles/colors.dart';
import '../../themes/styles/typography.dart';
import '../buttons/button_circle_svg.dart';

class FieldQuantity extends StatelessWidget {
  const FieldQuantity({
    required this.addFunction,
    required this.minusFunction,
    required this.maxValue,
    required this.value,
    super.key,
  });

  final int value;
  final int maxValue;
  final Function() addFunction;
  final Function() minusFunction;

  @override
  Widget build(BuildContext context) {
    bool minusActive = value > 1;
    bool addActive = value < maxValue;
    return Container(
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: neutral950, width: 1), // Borde verde de 2px
        borderRadius: BorderRadius.all(
            Radius.circular(12)), // Misma curvatura del ClipRRect
      ),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ButtonCircleSvg(
            assetName: 'assets/svg/minus-icon.svg',
            width: 24,
            color: minusActive ? secondaryBase : neutral400,
            onTap: minusActive ? minusFunction : null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              value.toString(),
              style: TypographyStyle.bodyBlackLarge.copyWith(color: neutral950),
            ),
          ),
          ButtonCircleSvg(
            assetName: 'assets/svg/add-icon.svg',
            color: addActive ? secondaryBase : neutral400,
            width: 24,
            onTap: addActive ? addFunction : null,
          ),
        ],
      ),
    );
  }
}
