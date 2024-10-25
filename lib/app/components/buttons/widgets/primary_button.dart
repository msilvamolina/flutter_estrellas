import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';

class Primarybutton extends StatelessWidget {
  const Primarybutton({
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
    return ElevatedButton(
      onPressed: !(isLoaderButton && isLoading != null && isLoading!)
          ? onPressed
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            mainController.isThemeModeDark ? primaryDark : primaryBase,
        foregroundColor:
            mainController.isThemeModeDark ? Colors.white : Colors.black,
        side: BorderSide(
          color: mainController.isThemeModeDark ? primaryBase : Colors.black,
          width: 1,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
                      child: const CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
            : Text(
                label,
                textAlign: TextAlign.center,
                style: TypographyStyle.bodyBlackLarge,
              ),
      ),
    );
  }
}
