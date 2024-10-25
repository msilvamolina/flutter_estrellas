import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../themes/styles/colors.dart';

class Snackbars {
  Snackbars._();

  static void error(String error) {
    Get.snackbar(
      'Upps, ocurrió un error',
      error,
      maxWidth: 600,
      margin: const EdgeInsets.all(16),
      colorText: white,
      backgroundColor: Colors.red.withOpacity(0.5),
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: SvgPicture.asset(
          'assets/svg/logo.svg',
          colorFilter: ColorFilter.mode(
            white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  static void success(String error) {
    Get.snackbar(
      'Bien hecho!',
      error,
      maxWidth: 600,
      margin: const EdgeInsets.all(16),
      colorText: white,
      backgroundColor: Colors.green.withOpacity(0.5),
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: SvgPicture.asset(
          'assets/svg/logo.svg',
          colorFilter: ColorFilter.mode(
            white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  static void addToCatalog(
      ProductFirebaseLiteModel product, String catalogName) {
    MainController mainController = Get.find<MainController>();
    Color background = mainController.isThemeModeDark ? neutral950 : white;
    Color colorText = !mainController.isThemeModeDark ? neutral950 : white;

    Get.snackbar(
      product.name ?? '',
      'Guardado en $catalogName',
      titleText: Text(
        product.name ?? '',
        style: TypographyStyle.bodyBlackLarge,
      ),
      messageText: Text(
        'Guardado en $catalogName',
        style: TypographyStyle.bodyRegularMedium
            .copyWith(color: colorText.withOpacity(0.7)),
      ),
      maxWidth: 600,
      margin: const EdgeInsets.all(16),
      colorText: colorText,
      backgroundColor: background,
      borderRadius: 12,
      borderColor: Colors.black,
      borderWidth: 1.2,
      padding: const EdgeInsets.all(16),
      boxShadows: [
        BoxShadow(
          color: Color(0xFFF6A97D),
          offset: Offset(-3, 4),
        ),
      ],
      icon: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            product.thumbnail ?? '',
            fit: BoxFit.cover,
          ),
        ),
      ),
      mainButton: TextButton(
        onPressed: () {},
        child: SvgPicture.asset('assets/svg/catalog.svg'),
      ),
      snackPosition: SnackPosition.TOP,
    );
  }
}
