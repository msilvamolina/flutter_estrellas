import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bank_accounts_controller.dart';

class BankAccountsView extends GetView<BankAccountsController> {
  const BankAccountsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BankAccountsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BankAccountsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
