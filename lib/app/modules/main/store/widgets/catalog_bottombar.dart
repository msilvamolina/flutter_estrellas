import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../data/models/payments_types/payments_types_model.dart';
import '../../../../themes/styles/colors.dart';
import '../controllers/store_controller.dart';

class CatalogBottombar extends StatelessWidget {
  const CatalogBottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(
      id: 'view',
      builder: (controller) {
        return Container(
          margin: EdgeInsets.only(left: 30),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
            border: Border.all(
              width: 1.5,
              color: neutral900,
            ),
            boxShadow: [
              BoxShadow(
                color:
                    secondaryLight, // Ajusta el color y opacidad según tu necesidad
                blurRadius: 0, // Tamaño de desenfoque
                offset: Offset(-4, 4), // Posición de la sombra
              ),
            ],
          ),
          child: Card(
            color: white,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: ListTile(
                leading: Container(
                  width: 46,
                  height: 46,
                  child: Icon(
                    EstrellasIcons.shareNetwork,
                    size: 38,
                    color: secondaryBase,
                  ),
                ),
                title: Text(
                  controller.catalogSelectedMap.length > 0
                      ? '${controller.catalogSelectedMap.length} catálogos seleccionados'
                      : 'Seleccionar catálogo',
                  style: TypographyStyle.bodyBlackLarge,
                  textAlign: TextAlign.center,
                ),
                trailing: GestureDetector(
                  onTap: controller.showDeleteBottomBar,
                  child: Icon(
                    EstrellasIcons.trash,
                    size: 34,
                    color: error900,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
