import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
import '../controllers/select_payment_controller.dart';

class SelectPaymentView extends GetView<SelectPaymentController> {
  const SelectPaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Método de pago'),
        centerTitle: true,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              controller.confirmBuy();
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
                'Confirmar pago',
                textAlign: TextAlign.center,
                style: TypographyStyle.bodyRegularLarge
                    .copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: ListTile(
                onTap: () {},
                leading: CircleAvatar(child: Icon(Icons.money)),
                title: Text('Pago contraentrega'),
                trailing: Icon(Icons.check_box),
              ),
            )
          ],
        ),
      ),
    );
  }
}
