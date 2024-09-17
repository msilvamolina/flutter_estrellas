import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/themes/input_decoration.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../themes/styles/colors.dart';
import 'register_basic_data_controller.dart';

class RegisterBasicDataScreen extends StatelessWidget {
  const RegisterBasicDataScreen({super.key, this.isDialog = false});

  final bool isDialog;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterBasicDataDialogController>(
      init: RegisterBasicDataDialogController(),
      builder: (controller) {
        return SingleChildScrollView(
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
                      GetBuilder<MainController>(
                        id: 'input',
                        builder: (mainController) {
                          return ReactiveTextField(
                            formControlName: Fields.username.name,
                            keyboardType: TextInputType.name,
                            decoration: CustomInputDecoration.inputDecoration(
                              isThemeModeDark:
                                  controller.mainController.isThemeModeDark,
                              text: "Usuario",
                              // hintText: "Ingresa tu número de documento",
                              icon: Icons.person,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      GetBuilder<MainController>(
                        id: 'input',
                        builder: (mainController) {
                          return ReactiveTextField(
                            formControlName: Fields.document.name,
                            keyboardType: TextInputType.number,
                            decoration: CustomInputDecoration.inputDecoration(
                              isThemeModeDark:
                                  controller.mainController.isThemeModeDark,
                              text: "Documento",
                              hintText: "Ingresa tu número de documento",
                              icon: Icons.person,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      GetBuilder<MainController>(
                        id: 'input',
                        builder: (_) {
                          return ReactiveTextField(
                            formControlName: Fields.firstName.name,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            decoration: CustomInputDecoration.inputDecoration(
                              isThemeModeDark:
                                  controller.mainController.isThemeModeDark,
                              text: "Nombre",
                              icon: Icons.person,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 16),
                      GetBuilder<MainController>(
                        id: 'input',
                        builder: (_) {
                          return ReactiveTextField(
                            formControlName: Fields.lastName.name,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            decoration: CustomInputDecoration.inputDecoration(
                              isThemeModeDark:
                                  controller.mainController.isThemeModeDark,
                              text: "Apellido",
                              icon: Icons.person,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 26),
                      GetBuilder<MainController>(
                        id: 'input',
                        builder: (_) {
                          return ReactiveFormConsumer(
                            builder: (context, form, child) => ElevatedButton(
                              onPressed: form.valid
                                  ? () => controller.sendForm(form.value)
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    controller.mainController.isThemeModeDark
                                        ? primaryDark
                                        : primaryBase,
                                foregroundColor:
                                    controller.mainController.isThemeModeDark
                                        ? Colors.white
                                        : Colors.black,
                                side: BorderSide(
                                  color:
                                      controller.mainController.isThemeModeDark
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
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }),
        );
      },
    );
  }
}
