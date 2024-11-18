import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/appbar/estrellas_appbar.dart';
import '../../widgets/bottombar.dart';
import '../controllers/store_controller.dart';

class StoreView extends GetView<StoreController> {
  const StoreView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: EstrellasAppbar(
        title: 'Mís catálogos',
        withBackButton: false,
      ),
      bottomNavigationBar: Bottombar(
        viewSelected: 3,
        isDarkTheme: false,
      ),
      body: Center(
        child: Text('wallet'),
      ),
    );
  }
}
