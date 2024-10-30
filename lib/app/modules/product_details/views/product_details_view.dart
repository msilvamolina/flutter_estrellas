import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import 'package:get/get.dart';

import '../../../themes/styles/colors.dart';
import '../controllers/product_details_controller.dart';
import '../widgets/product_appbar.dart';
import '../widgets/product_main_header.dart';
import '../widgets/product_sticky_content.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    double tmbSize = 90;
    bool isIos = false;
    bool isAndroid = false;

    if (!kIsWeb) {
      isIos = Platform.isIOS;
      isAndroid = Platform.isAndroid;
    }
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16, vertical: isIos ? 0 : (isAndroid ? 8 : 16)),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shadowColor: controller.mainController.isThemeModeDark
                          ? secondaryLight
                          : secondaryBase,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      foregroundColor: controller.mainController.isThemeModeDark
                          ? Colors.white
                          : Colors.black,
                      side: BorderSide(
                        color: controller.mainController.isThemeModeDark
                            ? neutral700
                            : Colors.black, // Color del borde
                        width: 1, // Ancho del borde
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      child: Text(
                        'Vender',
                        textAlign: TextAlign.center,
                        style: TypographyStyle.bodyRegularLarge
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.userProductController
                          .addToCart(controller.productLite);
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller.mainController.isThemeModeDark
                          ? primaryDark
                          : primaryBase,
                      foregroundColor: controller.mainController.isThemeModeDark
                          ? Colors.white
                          : Colors.black,
                      side: BorderSide(
                        color: controller.mainController.isThemeModeDark
                            ? primaryBase
                            : Colors.black, // Color del borde
                        width: 1, // Ancho del borde
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      child: Text(
                        'Comprar',
                        textAlign: TextAlign.center,
                        style: TypographyStyle.bodyRegularLarge
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Detalle de producto',
            style: TypographyStyle.bodyBlackLarge,
          ),
        ),
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            ProductMainHeader(),
            ProductStickyContent(),
          ],
        ),
      ),
    );
  }
}
