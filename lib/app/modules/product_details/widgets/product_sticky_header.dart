import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
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
        color: white,
        child: TabBar(
          labelStyle: TypographyStyle.bodyBlackLarge,
          indicatorColor: primaryBase,
          labelColor:
              mainController.isThemeModeDark ? secondaryLight : secondaryBase,
          tabs: [
            Tab(text: "Descripción"),
            Tab(text: "Detalles"),
            Tab(text: "Garantía"),
          ],
        ),
      ),
    );
  }
}
