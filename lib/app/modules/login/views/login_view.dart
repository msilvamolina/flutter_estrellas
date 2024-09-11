import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/layouts/auth_layout.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: const Center(
        child: Text(
          'Login is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
