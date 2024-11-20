// import 'package:flutter/material.dart';
// import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
// import 'package:flutter_estrellas/app/themes/input_decoration.dart';
// import 'package:flutter_estrellas/app/themes/styles/colors.dart';
// import 'package:flutter_estrellas/app/themes/styles/typography.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:reactive_forms/reactive_forms.dart';

// import 'register_controller.dart';

// class RegisterScreen extends StatelessWidget {
//   const RegisterScreen({super.key, this.isDialog = false});

//   final bool isDialog;
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<RegisterDialogController>(
//         init: RegisterDialogController(),
//         builder: (controller) {
//           return Stack(
//             children: [
//               SingleChildScrollView(
//                 child: ReactiveFormBuilder(
//                     form: controller.buildForm,
//                     builder: (context, form, child) {
//                       return Container(
//                         width: 400,
//                         child: ListBody(
//                           children: <Widget>[
//                             if (isDialog)
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(Icons.help_outline),
//                                   ),
//                                 ],
//                               ),
//                             Hero(
//                               tag: 'logo',
//                               child: SvgPicture.asset(
//                                 'assets/svg/logo.svg',
//                                 width: 100,
//                               ),
//                             ),
//                             SizedBox(height: 16),
//                             Text(
//                               'Crea una\ncuenta de Estrellas',
//                               textAlign: TextAlign.center,
//                               style: TypographyStyle.h2Mobile
//                                   .copyWith(fontWeight: FontWeight.w600),
//                             ),
//                             SizedBox(height: 26),
//                             GetBuilder<MainController>(
//                               id: 'input',
//                               builder: (_) {
//                                 return ReactiveTextField(
//                                   formControlName: Fields.email.name,
//                                   keyboardType: TextInputType.emailAddress,
//                                   decoration:
//                                       CustomInputDecoration.inputDecoration(
//                                     isThemeModeDark: controller
//                                         .mainController.isThemeModeDark,
//                                     text: "E-mail",
//                                     icon: Icons.email,
//                                   ),
//                                 );
//                               },
//                             ),
//                             SizedBox(height: 16),
//                             GetBuilder<MainController>(
//                               id: 'input',
//                               builder: (_) {
//                                 return ReactiveTextField(
//                                   obscureText: true,
//                                   formControlName: Fields.password.name,
//                                   keyboardType: TextInputType.text,
//                                   decoration:
//                                       CustomInputDecoration.inputDecoration(
//                                     isThemeModeDark: controller
//                                         .mainController.isThemeModeDark,
//                                     text: "Contraseña",
//                                     icon: Icons.security,
//                                   ),
//                                 );
//                               },
//                             ),
//                             SizedBox(height: 16),
//                             GetBuilder<MainController>(
//                               id: 'input',
//                               builder: (_) {
//                                 return ReactiveTextField(
//                                   obscureText: true,
//                                   formControlName:
//                                       Fields.passwordConfirmation.name,
//                                   keyboardType: TextInputType.text,
//                                   decoration:
//                                       CustomInputDecoration.inputDecoration(
//                                     isThemeModeDark: controller
//                                         .mainController.isThemeModeDark,
//                                     text: "Confirmar Contraseña",
//                                     icon: Icons.security,
//                                   ),
//                                 );
//                               },
//                             ),
//                             SizedBox(height: 26),
//                             GetBuilder<MainController>(
//                               id: 'input',
//                               builder: (_) {
//                                 return ReactiveFormConsumer(
//                                   builder: (context, form, child) =>
//                                       ElevatedButton(
//                                     onPressed: (form.valid &&
//                                             controller.buttonEnabled)
//                                         ? () => controller.sendForm(form.value)
//                                         : null,
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: controller
//                                               .mainController.isThemeModeDark
//                                           ? primaryDark
//                                           : primaryBase,
//                                       foregroundColor: controller
//                                               .mainController.isThemeModeDark
//                                           ? Colors.white
//                                           : Colors.black,
//                                       side: BorderSide(
//                                         color: controller
//                                                 .mainController.isThemeModeDark
//                                             ? primaryBase
//                                             : Colors.black, // Color del borde
//                                         width: 1, // Ancho del borde
//                                       ),
//                                     ),
//                                     child: Container(
//                                       padding: EdgeInsets.all(8),
//                                       width: double.infinity,
//                                       child: Text(
//                                         'Crear cuenta',
//                                         textAlign: TextAlign.center,
//                                         style: TypographyStyle.bodyRegularLarge
//                                             .copyWith(
//                                                 fontWeight: FontWeight.w400),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                             SizedBox(height: 36),
//                             GetBuilder<MainController>(
//                               id: 'input',
//                               builder: (_) {
//                                 return Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Hero(
//                                       tag: 'buttonGoogle',
//                                       child: ColorFiltered(
//                                         colorFilter: ColorFilter.mode(
//                                           controller.mainController
//                                                   .isThemeModeDark
//                                               ? white
//                                               : Colors
//                                                   .black, // El color al que quieres convertir la imagen
//                                           BlendMode
//                                               .srcIn, // Aplica el color a la imagen
//                                         ),
//                                         child: Image.asset(
//                                           'assets/images/google.png',
//                                           width: 46,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: 16),
//                                     Hero(
//                                       tag: 'buttonApple',
//                                       child: ColorFiltered(
//                                         colorFilter: ColorFilter.mode(
//                                           controller.mainController
//                                                   .isThemeModeDark
//                                               ? white
//                                               : Colors
//                                                   .black, // El color al que quieres convertir la imagen
//                                           BlendMode
//                                               .srcIn, // Aplica el color a la imagen
//                                         ),
//                                         child: Image.asset(
//                                           'assets/images/apple.png',
//                                           width: 46,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: 16),
//                                     Hero(
//                                       tag: 'buttonFacebook',
//                                       child: ColorFiltered(
//                                         colorFilter: ColorFilter.mode(
//                                           controller.mainController
//                                                   .isThemeModeDark
//                                               ? white
//                                               : Colors
//                                                   .black, // El color al que quieres convertir la imagen
//                                           BlendMode
//                                               .srcIn, // Aplica el color a la imagen
//                                         ),
//                                         child: Image.asset(
//                                           'assets/images/facebook.png',
//                                           width: 46,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 );
//                               },
//                             ),
//                             SizedBox(height: 120),
//                           ],
//                         ),
//                       );
//                     }),
//               ),
//             ],
//           );
//         });
//   }
// }
