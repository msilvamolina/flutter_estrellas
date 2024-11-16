import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/buttons/buttons.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/colors.dart';
import '../../widgets/bottombar.dart';
import '../controllers/wallet_controller.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: Button(
          style: ButtonStyles.secondary,
          label: 'Ordenes',
          onPressed: () {
            Get.toNamed(Routes.ORDERS_LIST);
          },
        )),
      ),
    );
  }
}
