import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';

import '../../../../components/buttons/buttons.dart';
import '../../../../data/models/user_catalog/user_catalog_model.dart';
import '../../../../themes/styles/colors.dart';

class CatalogCard extends StatelessWidget {
  const CatalogCard({required this.catalogModel, super.key});

  final UserCatalogModel catalogModel;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 2;
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    8), // Opcional, para bordes redondeados
                child: SizedBox(
                  width: size, // Tamaño del cuadrado
                  height: size,
                  child: catalogModel.imageUrl != null
                      ? Image.network(
                          catalogModel.imageUrl!,
                          fit: BoxFit.cover, // Asegura que llene el espacio
                        )
                      : Image.asset(
                          'assets/images/catalog.png',
                        ),
                ),
              ),
              Positioned(
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: white,
                    child: Icon(
                      EstrellasIcons.shareNetwork,
                      color: secondaryBase,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          Text(
            catalogModel.name,
            style: TypographyStyle.bodyRegularLarge,
          ),
          Text(
            '${catalogModel.videos!.length} productos',
            style: TypographyStyle.bodyRegularMedium,
          ),
          SizedBox(height: 8),
          Text(
            'Vender',
            style: TypographyStyle.bodyBlackLarge.copyWith(
              color: secondaryBase,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
