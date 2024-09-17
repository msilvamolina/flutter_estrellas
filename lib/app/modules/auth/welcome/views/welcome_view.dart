import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';

import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../app/dialogs/welcome/welcome_screen.dart';
import '../../../../components/layouts/auth_layout.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: WelcomeScreen(),
    );
  }
}
