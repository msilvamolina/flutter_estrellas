import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';

import 'package:get/get.dart';

import '../../../../components/buttons/buttons.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../../widgets/bottombar.dart';
import '../controllers/wallet_controller.dart';
import '../widgets/wallet_empty_state.dart';
import '../widgets/wallet_main_card.dart';
import '../widgets/wallet_orders_alert.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      extendBody: true,
      bottomNavigationBar: Bottombar(
        viewSelected: 1,
        isDarkTheme: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WalletMainCard(),
              GestureDetector(
                onTap: controller.goToOrders,
                child: WalletOrdersAlert(
                  orderNumber:
                      controller.userProductController.listOrder.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Últimos movimientos',
                          style: TypographyStyle.h3Mobile,
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              EstrellasIcons.slidersHorizontal,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              WalletEmptyState(),
            ],
          ),
        ),
      ),
    );
  }
}
