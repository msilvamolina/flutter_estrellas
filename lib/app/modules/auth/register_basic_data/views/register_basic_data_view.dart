import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_basic_data_controller.dart';

class RegisterBasicDataView extends GetView<RegisterBasicDataController> {
  const RegisterBasicDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterBasicDataView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RegisterBasicDataView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
