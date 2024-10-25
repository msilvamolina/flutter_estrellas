import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/themes/input_decoration.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../themes/styles/colors.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    required this.formControlName,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.autofocus = false,
    super.key,
  });

  final String formControlName;
  final bool autofocus;
  final String label;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    Color labelBackgroundColor =
        !mainController.isThemeModeDark ? secondaryDark : secondaryLight;

    return ReactiveTextField(
      autofocus: autofocus,
      formControlName: formControlName,
      keyboardType: keyboardType,
      cursorColor: labelBackgroundColor,
      decoration: CustomInputDecoration.inputDecoration(
        text: label,
      ),
    );
  }
}
