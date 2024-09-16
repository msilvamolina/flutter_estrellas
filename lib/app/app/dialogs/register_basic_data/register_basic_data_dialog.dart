import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/services/theme_service.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../themes/input_decoration.dart';
import 'register_basic_data_controller.dart';

class RegisterBasicDataDialog extends StatelessWidget {
  const RegisterBasicDataDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterBasicDataDialogController>(
      init: RegisterBasicDataDialogController(),
      builder: (controller) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: AlertDialog(
            content: Stack(
              children: [
                SingleChildScrollView(
                  child: ReactiveFormBuilder(
                      form: controller.buildForm,
                      builder: (context, form, child) {
                        return Container(
                          width: 400,
                          child: ListBody(
                            children: <Widget>[
                              Hero(
                                tag: 'logo',
                                child: SvgPicture.asset(
                                  'assets/svg/logo.svg',
                                  width: 100,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Necesitamos saber\nmás sobre vos',
                                textAlign: TextAlign.center,
                                style: TypographyStyle.h2Mobile
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 26),
                              ReactiveTextField(
                                formControlName: Fields.username.name,
                                keyboardType: TextInputType.name,
                                decoration:
                                    CustomInputDecoration.inputDecoration(
                                  text: "Documento",
                                  hintText: "Ingresa tu número de documento",
                                  icon: Icons.person,
                                ),
                              ),
                              SizedBox(height: 16),
                              ReactiveTextField(
                                formControlName: Fields.firstName.name,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                decoration:
                                    CustomInputDecoration.inputDecoration(
                                  text: "Nombre",
                                  icon: Icons.person,
                                ),
                              ),
                              SizedBox(height: 16),
                              ReactiveTextField(
                                formControlName: Fields.lastName.name,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                decoration:
                                    CustomInputDecoration.inputDecoration(
                                  text: "Apellido",
                                  icon: Icons.person,
                                ),
                              ),
                              SizedBox(height: 26),
                              ReactiveFormConsumer(
                                builder: (context, form, child) =>
                                    ElevatedButton(
                                  onPressed: form.valid
                                      ? () => controller.sendForm(form.value)
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ThemeService.isDark()
                                        ? primaryDark
                                        : primaryBase,
                                    foregroundColor: ThemeService.isDark()
                                        ? Colors.white
                                        : Colors.black,
                                    side: BorderSide(
                                      color: ThemeService.isDark()
                                          ? primaryBase
                                          : Colors.black, // Color del borde
                                      width: 1, // Ancho del borde
                                    ),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    width: double.infinity,
                                    child: Text(
                                      'Guardar',
                                      textAlign: TextAlign.center,
                                      style: TypographyStyle.bodyRegularLarge
                                          .copyWith(
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
