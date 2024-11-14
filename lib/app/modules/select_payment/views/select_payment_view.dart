import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/appbar/estrellas_appbar.dart';
import '../../../components/buttons/buttons.dart';
import '../../../components/step_indicator/step_indicator.dart';
import '../../../routes/app_pages.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
import '../../cart/widget/cart_price_bottom_sheet.dart';
import '../controllers/select_payment_controller.dart';

class SelectPaymentView extends GetView<SelectPaymentController> {
  const SelectPaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: EstrellasAppbar(
        title: 'Método de pago',
      ),
      bottomNavigationBar: Obx(
        () => controller.userProductController.listProductCart.isNotEmpty
            ? SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => CartPriceBottomBar(
                          productsPoints:
                              controller.userProductController.cartPoints.value,
                          productsQuantity: controller
                              .userProductController.cartQuantity.value,
                          productsPrices:
                              controller.userProductController.cartPrices.value,
                          productsShipping: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Button(
                          onPressed: () {},
                          label: 'Confirmar pago',
                          style: ButtonStyles.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : SizedBox.shrink(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            StepIndicator(
              currentStep: 2,
              totalSteps: 2,
            ),
            SizedBox(height: 26),
            Card(
              color: neutral100,
              elevation: 0,
              child: ListTile(
                onTap: () {},
                leading: CircleAvatar(child: Icon(Icons.money)),
                title: Text('Pago contra entrega'),
                trailing: Icon(Icons.check_box),
              ),
            )
          ],
        ),
      ),
    );
  }
}
