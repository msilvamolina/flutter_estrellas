import 'package:flutter/material.dart';

import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../util/constants.dart';

class ProgressButton extends StatelessWidget {
  final Size size;
  final double progress;
  const ProgressButton({super.key, required this.size, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kPrimaryColor.withOpacity(0.5)),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: kPrimaryColor,
              width: size.width * progress,
            ),
          ),
          Center(
              child: Text(
            "Mantén presionado para eliminar",
            style: TypographyStyle.bodyBlackMedium.copyWith(color: white),
          ))
        ],
      ),
    );
  }
}
