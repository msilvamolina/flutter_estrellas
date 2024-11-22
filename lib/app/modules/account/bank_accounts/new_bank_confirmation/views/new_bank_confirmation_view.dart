import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_bank_confirmation_controller.dart';

class NewBankConfirmationView extends GetView<NewBankConfirmationController> {
  const NewBankConfirmationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewBankConfirmationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewBankConfirmationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
