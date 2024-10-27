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

  static void productSnackbar(
      ProductFirebaseLiteModel product, String message) {
    MainController mainController = Get.find<MainController>();
    Color background = mainController.isThemeModeDark ? neutral950 : white;
    Color colorText = !mainController.isThemeModeDark ? neutral950 : white;

    Get.rawSnackbar(
      messageText: SizedBox(
        height: 90, // Ajusta la altura según sea necesario
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.thumbnail ?? '',
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.name ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: colorText,
                      ),
                    ),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 14,
                        color: colorText.withOpacity(0.8),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SvgPicture.asset(
                  'assets/svg/catalog.svg',
                  width: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      maxWidth: 600,
      margin: EdgeInsets.all(16),
      backgroundColor: background,
      borderRadius: 16,
      borderColor: Colors.black,
      borderWidth: 1.2,
      padding: EdgeInsets.zero,
      boxShadows: [
        BoxShadow(
          color: Color(0xFFF6A97D),
          offset: Offset(-3, 4),
        ),
      ],
      snackPosition: SnackPosition.TOP,
    );
  }
}
