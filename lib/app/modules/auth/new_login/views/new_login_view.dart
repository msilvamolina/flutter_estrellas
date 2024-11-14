import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_login_controller.dart';

class NewLoginView extends GetView<NewLoginController> {
  const NewLoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewLoginView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewLoginView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
