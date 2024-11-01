import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/bottombar.dart';
import '../controllers/wallet_controller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Bottombar(
        viewSelected: 1,
        isDarkTheme: false,
      ),
      body: Center(
        child: Text('wallet'),
      ),
    );
  }
}
