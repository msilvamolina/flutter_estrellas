import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/phone_verification_controller.dart';

class PhoneVerificationView extends GetView<PhoneVerificationController> {
  const PhoneVerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhoneVerificationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PhoneVerificationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
