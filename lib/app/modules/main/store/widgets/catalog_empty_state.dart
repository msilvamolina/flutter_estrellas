import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/buttons/buttons.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/store_controller.dart';

class CatalogEmptyState extends StatelessWidget {
  const CatalogEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/catalog.png';
    return GetBuilder<StoreController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: white,
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  right: -130,
                  top: 80,
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      image,
                      width: 320,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Spacer(),
                      Image.asset(
                        image,
                        width: 100,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'No tienes catálogos aún',
                        style: TypographyStyle.bodyBlackLarge.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '¡Crea uno y gana puntos con cada venta!',
                        style: TypographyStyle.bodyRegularLarge.copyWith(),
                      ),
                      SizedBox(height: 22),
                      Button(
                        label: 'Crear catálogo',
                        onPressed: controller.openAddCatalogBottomSheet,
                        style: ButtonStyles.primary,
                      ),
                      SizedBox(height: 22),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
