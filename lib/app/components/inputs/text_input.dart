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
    this.hintText,
    this.maxLines,
    this.autofocus = false,
    this.validationMessages,
    super.key,
  });

  final String formControlName;
  final bool autofocus;
  final String label;
  final String? hintText;
  final TextInputType keyboardType;
  final int? maxLines;
  final Map<String, String Function(Object)>? validationMessages;
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    Color labelBackgroundColor =
        !mainController.isThemeModeDark ? secondaryDark : secondaryLight;

    final control =
        ReactiveForm.of(context)!.findControl(formControlName) as FormControl?;

    return ReactiveTextField(
      autofocus: autofocus,
      maxLines: maxLines,
      formControlName: formControlName,
      keyboardType: keyboardType,
      cursorColor: labelBackgroundColor,
      decoration: CustomInputDecoration.inputDecorationControl(
        text: label,
        hintText: hintText,
        control: control!,
      ),
      validationMessages: validationMessages ??
          {
            ValidationMessage.required: (error) => 'Este campo es obligatorio.',
            ValidationMessage.minLength: (error) =>
                'Debe tener al menos ${(error as Map)['requiredLength']} caracteres.',
            ValidationMessage.email: (error) =>
                'Ingrese un correo electrónico válido.',
            ValidationMessage.number: (error) =>
                'Sólo puedes ingresar números.',
          },
    );
  }
}
