import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/bottombar_layout.dart';
import '../controllers/wallet_controller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottombarLayout(
        viewSelected: 1,
        child: Center(
          child: Text('Wallet'),
        ),
      ),
    );
  }
}
