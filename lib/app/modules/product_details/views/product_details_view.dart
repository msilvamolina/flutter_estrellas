import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import 'package:get/get.dart';

import '../../../components/buttons/buttons.dart';
import '../../../themes/styles/colors.dart';
import '../controllers/product_details_controller.dart';
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
      child: GetBuilder<ProductDetailsController>(
        id: 'view',
        builder: (_) {
          return Scaffold(
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16, vertical: isIos ? 0 : (isAndroid ? 8 : 16)),
                child: Row(
                  children: [
                    Expanded(
                      child: Button(
                        style: ButtonStyles.secondary,
                        onPressed: () {},
                        label: 'Vender',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Button(
                        style: ButtonStyles.primary,
                        onPressed: controller.buyProduct,
                        label: 'Comprar',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: white,
            appBar: EstrellasAppbar(title: 'Detalle de producto'),
            body: CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                ProductMainHeader(),
                ProductStickyContent(),
              ],
            ),
          );
        },
      ),
    );
  }
}
