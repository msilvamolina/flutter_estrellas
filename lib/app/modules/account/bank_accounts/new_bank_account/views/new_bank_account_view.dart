import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_bank_account_controller.dart';

class NewBankAccountView extends GetView<NewBankAccountController> {
  const NewBankAccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewBankAccountView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewBankAccountView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
