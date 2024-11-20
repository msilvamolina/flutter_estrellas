import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';

import '../../../../components/buttons/buttons.dart';
import '../../../../libraries/icons/icons_font.dart';
import '../../../../themes/styles/colors.dart';
import '../controllers/wallet_controller.dart';

class WalletMainCard extends StatelessWidget {
  const WalletMainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(
      id: 'walletMainCard',
      builder: (controller) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.all(Radius.circular(26)),
            border: Border.all(
              width: 1,
              color: neutral900,
            ),
            boxShadow: [
              BoxShadow(
                color:
                    secondaryLight, // Ajusta el color y opacidad según tu necesidad
                blurRadius: 0, // Tamaño de desenfoque
                offset: Offset(-8, 8), // Posición de la sombra
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 26),
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Ganancia disponible',
                        style: TypographyStyle.bodyRegularLarge,
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '\$0',
                            style: TypographyStyle.h2Mobile,
                          ),
                          SizedBox(width: 2),
                          Container(
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.only(
                                left: 8, right: 8, top: 0, bottom: 0),
                            decoration: BoxDecoration(
                              color: success50,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '0 puntos',
                                  style: TypographyStyle.bodyRegularMedium
                                      .copyWith(color: success900),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/images/bill.png',
                    width: 68,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Button(
                      style: ButtonStyles.primary,
                      label: 'Retirar',
                      onPressed: null,
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  ),
                  Expanded(
                    child: Button(
                      style: ButtonStyles.secondary,
                      label: 'Redimir',
                      onPressed: null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
