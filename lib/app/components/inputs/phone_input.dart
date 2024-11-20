import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/themes/input_decoration.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';

import '../../themes/styles/colors.dart';
import '../../themes/styles/typography.dart';

class CustomPhoneInput extends StatelessWidget {
  const CustomPhoneInput({
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

    return ReactivePhoneFormField<PhoneNumber>(
      formControlName: formControlName,
      valueAccessor: PhoneNumberValueAccessor(),
      validationMessages: {
        ...PhoneValidationMessage.localizedValidationMessages(
          context,
        ),
        ValidationMessage.required: (error) => 'Este campo es obligatorio.',
        ValidationMessage.minLength: (error) =>
            'Debe tener al menos ${(error as Map)['requiredLength']} caracteres.',
        ValidationMessage.email: (error) =>
            'Ingrese un correo electrónico válido.',
        ValidationMessage.number: (error) => 'Sólo puedes ingresar números.',
      },
      cursorColor: labelBackgroundColor,
      decoration: CustomInputDecoration.inputDecorationControl(
        text: label,
        hintText: hintText,
        control: control!,
      ),
      countrySelectorNavigator: CountrySelectorNavigator.dialog(
        searchBoxTextStyle: TypographyStyle.bodyRegularLarge,
        countries: [IsoCode.CO, IsoCode.AR, IsoCode.HR, IsoCode.IT],
      ),
    );
  }
}
