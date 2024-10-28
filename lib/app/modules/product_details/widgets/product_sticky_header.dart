import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../../../themes/styles/colors.dart';

class ProductStickyHeader extends StatelessWidget {
  const ProductStickyHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();

    return PreferredSize(
      preferredSize: TabBar(
        tabs: <Widget>[],
      ).preferredSize,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              // color: neutral800,
              width: 2,
            ),
          ),
        ),
        child: TabBar(
          indicatorColor: primaryBase,
          labelColor:
              mainController.isThemeModeDark ? secondaryLight : secondaryBase,
          tabs: [
            Tab(text: "Descripción"),
            Tab(text: "Contenido"),
            Tab(text: "Resumen"),
          ],
        ),
      ),
    );
  }
}
