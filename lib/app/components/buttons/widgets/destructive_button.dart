import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';

class DestructiveButton extends StatelessWidget {
  const DestructiveButton({
    required this.onPressed,
    required this.label,
    required this.isLoaderButton,
    this.isLoading,
    super.key,
  });

  final Function()? onPressed;
  final String label;
  final bool isLoaderButton;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    Color backgroundColor = error500;
    Color foregroundColor = white;
    Color loaderColor = error900;
    Color border =
        mainController.isThemeModeDark ? backgroundColor : neutral950;
    Color shadowColor = error900;

    return ElevatedButton(
      onPressed: !(isLoaderButton && isLoading != null && isLoading!)
          ? onPressed
          : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return neutral200;
            }
            return backgroundColor;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return neutral800;
            }
            return foregroundColor;
          },
        ),
        side: MaterialStateProperty.resolveWith<BorderSide?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(color: neutral200, width: 1);
            }
            return BorderSide(color: border, width: 1);
          },
        ),
        shadowColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return shadowColor;
            }
            return shadowColor;
          },
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return shadowColor;
            }
            return shadowColor;
          },
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        width: double.infinity,
        child: isLoaderButton
            ? !isLoading!
                ? Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TypographyStyle.bodyBlackLarge,
                  )
                : Center(
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(loaderColor)),
                    ),
                  )
            : Text(
                label,
                textAlign: TextAlign.center,
                style: TypographyStyle.bodyBlackLarge2,
              ),
      ),
    );
  }
}
