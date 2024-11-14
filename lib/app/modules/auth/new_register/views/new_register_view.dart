import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_register_controller.dart';

class NewRegisterView extends GetView<NewRegisterController> {
  const NewRegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewRegisterView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewRegisterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
