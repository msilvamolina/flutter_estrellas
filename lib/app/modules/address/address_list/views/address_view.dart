import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/address_controller.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis domicilios'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.NEW_ADDRESS),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              // Get.toNamed(Routes.ADDRESS);
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
                'Continuar compra',
                textAlign: TextAlign.center,
                style: TypographyStyle.bodyRegularLarge
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'AddressView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
