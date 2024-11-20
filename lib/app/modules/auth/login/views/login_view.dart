// import 'package:flutter/material.dart';
// import 'package:flutter_estrellas/app/app/dialogs/login/login_screen.dart';
// import 'package:flutter_estrellas/app/components/layouts/auth_layout.dart';
// import 'package:flutter_estrellas/app/modules/auth/login/controllers/login_controller.dart';
// import 'package:get/get.dart';

// import '../../../../app/controllers/main_controller.dart';

// class LoginView extends GetView<LoginController> {
//   const LoginView({super.key});
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return AuthLayout(
//       child: Scaffold(
//         appBar: AppBar(
//           actions: [
//             GetBuilder<MainController>(
//               id: 'themeButton',
//               builder: (mainController) {
//                 return IconButton(
//                   onPressed: mainController.changeThemeMode,
//                   icon: Icon(mainController.getThemeIcon()),
//                 );
//               },
//             ),
//             Hero(
//               tag: 'helpButton',
//               child: IconButton(
//                 onPressed: controller.mainController.openAlertHelpText,
//                 icon: Icon(Icons.help_outline),
//               ),
//             ),
//           ],
//         ),
//         body: Center(
//             child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: LoginScreen(),
//         )),
//       ),
//     );
//   }
// }
