import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/services/theme_service.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:shimmer/shimmer.dart';

import '../../../themes/input_decoration.dart';
import 'login_controller.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginDialogController>(
      init: LoginDialogController(),
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.help_outline),
                                  ),
                                ],
                              ),
                              Hero(
                                tag: 'logo',
                                child: SvgPicture.asset(
                                  'assets/svg/logo.svg',
                                  width: 100,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Ingresa a tu\ncuenta de Estrellas',
                                textAlign: TextAlign.center,
                                style: TypographyStyle.h2Mobile
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 26),
                              ReactiveTextField(
                                formControlName: Fields.email.name,
                                keyboardType: TextInputType.emailAddress,
                                decoration:
                                    CustomInputDecoration.inputDecoration(
                                  text: "E-mail",
                                  icon: Icons.email,
                                ),
                              ),
                              SizedBox(height: 16),
                              ReactiveTextField(
                                obscureText: true,
                                formControlName: Fields.password.name,
                                keyboardType: TextInputType.text,
                                decoration:
                                    CustomInputDecoration.inputDecoration(
                                  text: "Contraseña",
                                  icon: Icons.security,
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
                                      'Iniciar sesión',
                                      textAlign: TextAlign.center,
                                      style: TypographyStyle.bodyRegularLarge
                                          .copyWith(
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Olvidé mi contraseña',
                                  style: TypographyStyle.linkRegularLarge
                                      .copyWith(
                                          decoration: TextDecoration.underline,
                                          decorationColor: ThemeService.isDark()
                                              ? secondaryLight
                                              : secondaryBase,
                                          color: ThemeService.isDark()
                                              ? secondaryLight
                                              : secondaryBase),
                                ),
                              ),
                              SizedBox(height: 26),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      ThemeService.isDark()
                                          ? white
                                          : Colors
                                              .black, // El color al que quieres convertir la imagen
                                      BlendMode
                                          .srcIn, // Aplica el color a la imagen
                                    ),
                                    child: Image.asset(
                                      'assets/images/google.png',
                                      width: 46,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      ThemeService.isDark()
                                          ? white
                                          : Colors
                                              .black, // El color al que quieres convertir la imagen
                                      BlendMode
                                          .srcIn, // Aplica el color a la imagen
                                    ),
                                    child: Image.asset(
                                      'assets/images/apple.png',
                                      width: 46,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      ThemeService.isDark()
                                          ? white
                                          : Colors
                                              .black, // El color al que quieres convertir la imagen
                                      BlendMode
                                          .srcIn, // Aplica el color a la imagen
                                    ),
                                    child: Image.asset(
                                      'assets/images/facebook.png',
                                      width: 46,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 26),
                              Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10),
                                      width: double.infinity,
                                      height: 1,
                                      color: ThemeService.isDark()
                                          ? neutral300
                                          : neutral600,
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      child: Text(
                                        '¿Quieres ser una Estrella?',
                                        textAlign: TextAlign.center,
                                        style: TypographyStyle.bodyRegularMedium
                                            .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: ThemeService.isDark()
                                              ? neutral300
                                              : neutral600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 26),
                              ElevatedButton(
                                onPressed: controller.openRegisterDialog,
                                style: ElevatedButton.styleFrom(
                                  shadowColor: ThemeService.isDark()
                                      ? secondaryLight
                                      : secondaryBase,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.surface,
                                  foregroundColor: ThemeService.isDark()
                                      ? Colors.white
                                      : Colors.black,
                                  side: BorderSide(
                                    color: ThemeService.isDark()
                                        ? neutral700
                                        : Colors.black, // Color del borde
                                    width: 1, // Ancho del borde
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  width: double.infinity,
                                  child: Text(
                                    'Regístrate',
                                    textAlign: TextAlign.center,
                                    style: TypographyStyle.bodyRegularLarge
                                        .copyWith(fontWeight: FontWeight.w400),
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
