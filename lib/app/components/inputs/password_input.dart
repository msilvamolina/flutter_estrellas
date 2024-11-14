import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/input_decoration.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../themes/styles/colors.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    required this.formControlName,
    required this.label,
    required this.isObscure,
    required this.obscurePressed,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.autofocus = false,
    this.validationMessages,
    super.key,
  });

  final String formControlName;
  final bool autofocus;
  final String label;
  final bool isObscure;
  final Function() obscurePressed;
  final String? hintText;
  final TextInputType keyboardType;
  final Map<String, String Function(Object)>? validationMessages;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    Color labelBackgroundColor =
        !mainController.isThemeModeDark ? secondaryDark : secondaryLight;

    final control = ReactiveForm.of(context)!
        .findControl(widget.formControlName) as FormControl?;

    return ReactiveTextField(
      obscureText: widget.isObscure,
      autofocus: widget.autofocus,
      formControlName: widget.formControlName,
      keyboardType: widget.keyboardType,
      cursorColor: labelBackgroundColor,
      decoration: CustomInputDecoration.inputDecorationControl(
        text: widget.label,
        hintText: widget.hintText,
        control: control!,
        suffixIcon: IconButton(
          onPressed: () => widget.obscurePressed(),
          icon: Icon(
            widget.isObscure ? EstrellasIcons.eyeOff : EstrellasIcons.eye,
            size: 34,
          ),
        ),
      ),
      validationMessages: widget.validationMessages ??
          {
            ValidationMessage.required: (error) => 'Este campo es obligatorio.',
            ValidationMessage.minLength: (error) =>
                'Debe tener al menos ${(error as Map)['requiredLength']} caracteres.',
            ValidationMessage.email: (error) =>
                'Ingrese un correo electrónico válido.',
            ValidationMessage.number: (error) =>
                'Sólo puedes ingresar números.',
            ValidationMessage.mustMatch: (error) =>
                'Las contraseñas no coinciden',
          },
    );
  }
}
