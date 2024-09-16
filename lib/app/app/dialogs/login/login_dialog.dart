import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/services/theme_service.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        width: 400,
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/svg/logo.svg',
              width: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Ingresa a tu\ncuenta de Estrellas',
              textAlign: TextAlign.center,
              style: TypographyStyle.h2Mobile
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 26),
            TextField(
              keyboardType: TextInputType.text,
              // controller: controller.textController,

              onChanged: (v) {},
              decoration: InputDecoration(
                labelText: 'E-mail',
                hintText: 'Ingresa tu e-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              keyboardType: TextInputType.text,
              // controller: controller.textController,

              onChanged: (v) {},
              decoration: InputDecoration(
                labelText: 'Contraseña',
                hintText: 'Ingresa tu contraseña',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 26),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    ThemeService.isDark() ? primaryDark : primaryBase,
                foregroundColor:
                    ThemeService.isDark() ? Colors.white : Colors.black,
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
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: Text(
                'Olvidé mi contraseña',
                style: TypographyStyle.linkRegularLarge.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor:
                        ThemeService.isDark() ? secondaryLight : secondaryBase,
                    color:
                        ThemeService.isDark() ? secondaryLight : secondaryBase),
              ),
            ),
            SizedBox(height: 46),
            Stack(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    height: 1,
                    color: ThemeService.isDark() ? neutral300 : neutral600,
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    color: Theme.of(context).colorScheme.surface,
                    child: Text(
                      '¿Quieres ser una Estrella?',
                      textAlign: TextAlign.center,
                      style: TypographyStyle.bodyRegularMedium.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ThemeService.isDark() ? neutral300 : neutral600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 26),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shadowColor:
                    ThemeService.isDark() ? secondaryLight : secondaryBase,
                backgroundColor: Theme.of(context).colorScheme.surface,
                foregroundColor:
                    ThemeService.isDark() ? Colors.white : Colors.black,
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
      ),
    );
  }
}
