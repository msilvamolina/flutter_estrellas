import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenWidth < 480;
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(isMobile ? 0 : 60),
          color: Colors.red,
          constraints: BoxConstraints(maxWidth: 480),
          width: double.infinity,
          height: double.infinity,
          child: Text('holaaa'),
        ),
      ),
    );
  }
}
