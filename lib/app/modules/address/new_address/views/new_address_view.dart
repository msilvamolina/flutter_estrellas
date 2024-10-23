import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_address_controller.dart';

class NewAddressView extends GetView<NewAddressController> {
  const NewAddressView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewAddressView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewAddressView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
