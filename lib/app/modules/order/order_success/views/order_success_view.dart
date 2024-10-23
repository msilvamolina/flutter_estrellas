import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/order_success_controller.dart';

class OrderSuccessView extends GetView<OrderSuccessController> {
  const OrderSuccessView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderSuccessView'),
        centerTitle: true,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: controller.mainController.isThemeModeDark
                  ? primaryDark
                  : primaryBase,
              foregroundColor: controller.mainController.isThemeModeDark
                  ? Colors.white
                  : Colors.black,
              side: BorderSide(
                color: controller.mainController.isThemeModeDark
                    ? primaryBase
                    : Colors.black, // Color del borde
                width: 1, // Ancho del borde
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              child: Text(
                'Entendido',
                textAlign: TextAlign.center,
                style: TypographyStyle.bodyRegularLarge
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            '¡Has realizado tu compra de manera exitosa!',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
