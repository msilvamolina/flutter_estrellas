import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/select_payment_controller.dart';

class SelectPaymentView extends GetView<SelectPaymentController> {
  const SelectPaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectPaymentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SelectPaymentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
