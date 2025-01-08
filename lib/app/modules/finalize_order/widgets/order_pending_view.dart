import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/buttons/buttons.dart';
import '../../../routes/app_pages.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
import '../controllers/finalize_order_controller.dart';

class OrderPendingView extends StatelessWidget {
  const OrderPendingView({super.key});

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/congrats.png';
    return GetBuilder<FinalizeOrderController>(
      builder: (controller) {
        return SafeArea(
          child: Stack(
            children: [
              Positioned(
                right: -60,
                top: 80,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    image,
                    width: 320,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spacer(),
                    Image.asset(
                      image,
                      width: 100,
                    ),
                    SizedBox(height: 20),
                    Text(
                      '¡Pedido exitoso!',
                      style: TypographyStyle.bodyBlackLarge
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'Tu solicitud ha sido recibida, pero ',
                        style: TypographyStyle.bodyRegularLarge
                            .copyWith(color: neutral800),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'el pago está pendiente de validación.',
                            style: TypographyStyle.bodyBlackLarge.copyWith(
                                color: neutral800, fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text:
                                ' Una vez confirmado, iniciaremos la gestión de tu pedido.',
                            style: TypographyStyle.bodyRegularLarge
                                .copyWith(color: neutral800),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: 'Tu número de orden es ',
                        style: TypographyStyle.bodyRegularLarge
                            .copyWith(color: neutral800),
                        children: <TextSpan>[
                          TextSpan(
                            text: controller.orderNumber.value,
                            style: TypographyStyle.bodyRegularLarge
                                .copyWith(color: secondaryBase),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 22),
                    Button(
                      label: 'Entendido',
                      onPressed: () {
                        Get.offNamedUntil(
                          Routes.HOME,
                          (route) => route.isFirst,
                        );
                      },
                      style: ButtonStyles.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
