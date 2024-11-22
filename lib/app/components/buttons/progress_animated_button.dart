import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/controllers/main_controller.dart';
import '../../themes/styles/colors.dart';
import '../../themes/styles/typography.dart';
import 'buttons.dart';

class ProgressAnimatedButton extends StatelessWidget {
  const ProgressAnimatedButton({
    required this.label,
    required this.holdLabel,
    required this.progress,
    super.key,
  });

  final String label;
  final String holdLabel;
  final double progress;

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    Color backgroundColor = error900;
    Color foregroundColor = white;
    Color loaderColor = error900;
    Color border =
        mainController.isThemeModeDark ? backgroundColor : neutral950;
    Color shadowColor = error900;

    double sizeHeight = 52;
    double sizeWidth = MediaQuery.of(context).size.width;

    return Container(
      height: sizeHeight,
      width: sizeWidth,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: error900.withOpacity(0.4),
              blurRadius: 1, // Ajusta el blur según tu diseño.
              offset: Offset(
                  0, 2), // Cambia para personalizar la dirección de la sombra.
            ),
          ],
          border: Border.all(color: neutral900),
          borderRadius: BorderRadius.circular(26),
          color: progress > 0 ? error500.withOpacity(0.6) : error500),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: progress,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: Container(
                color: shadowColor,
                width: sizeWidth * progress,
              ),
            ),
          ),
          Container(
            height: sizeHeight,
            child: Center(
              child: Text(
                progress > 0 ? holdLabel : label,
                style: progress > 0
                    ? TypographyStyle.bodyBlackLarge.copyWith(color: white)
                    : TypographyStyle.bodyBlackLarge2.copyWith(color: white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
