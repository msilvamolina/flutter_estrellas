import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_start_controller.dart';

class LoginStartView extends GetView<LoginStartController> {
  const LoginStartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginStartView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoginStartView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
