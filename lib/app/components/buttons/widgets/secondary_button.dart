import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.onPressed,
    required this.label,
    required this.isLoaderButton,
    this.isLoading,
    this.image,
    super.key,
  });

  final Function()? onPressed;
  final String label;
  final bool isLoaderButton;
  final bool? isLoading;
  final Widget? image;
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    Color backgroundColor = mainController.isThemeModeDark ? white : white;
    Color shadowColor =
        mainController.isThemeModeDark ? secondaryLight : secondaryBase;
    Color foregroundColor =
        mainController.isThemeModeDark ? Colors.white : neutral950;
    Color loaderColor =
        mainController.isThemeModeDark ? primaryLight : primaryDark;
    Color border =
        mainController.isThemeModeDark ? backgroundColor : neutral950;

    return ElevatedButton(
      onPressed: !(isLoaderButton && isLoading != null && isLoading!)
          ? onPressed
          : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return backgroundColor.withOpacity(0.2);
            }
            return backgroundColor;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return foregroundColor.withOpacity(0.5);
            }
            return foregroundColor;
          },
        ),
        side: MaterialStateProperty.resolveWith<BorderSide?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(color: border.withOpacity(0.2), width: 1);
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
              return secondaryLight;
            }
            return secondaryLight;
          },
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        width: double.infinity,
        child: isLoaderButton
            ? !isLoading!
                ? Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TypographyStyle.bodyBlackLarge2,
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
            : image != null
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      image!,
                      Spacer(),
                      Text(
                        label,
                        textAlign: TextAlign.center,
                        style: TypographyStyle.bodyBlackLarge2,
                      ),
                      Spacer(),
                    ],
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
