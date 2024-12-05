import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payments_method_controller.dart';

class PaymentsMethodView extends GetView<PaymentsMethodController> {
  const PaymentsMethodView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaymentsMethodView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PaymentsMethodView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
