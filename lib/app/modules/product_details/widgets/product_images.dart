import 'dart:ui'; // Importa para el desenfoque de fondo
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import '../../../data/models/product_image/product_image_model.dart';
import '../../../themes/styles/colors.dart';

class ProductImagesCard extends StatelessWidget {
  const ProductImagesCard({required this.listImages, super.key});
  final List<ProductImageModel> listImages;
  final double imageSize = 66;
  final int imageLimit = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(26),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.1), // Transparente
                    Colors.white.withOpacity(0.3), // Blanco con opacidad de 0.4
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
                border:
                    Border.all(color: Colors.white.withOpacity(0.3), width: 1),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int index = 0;
                      index < listImages.length && index < imageLimit;
                      index++)
                    imageCard(
                      listImages[index].imageUrl,
                      isFinalImage: index == (listImages.length - 1),
                      imageCount:
                          index == (imageLimit - 1) ? getImageCount() : null,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  int getImageCount() => (listImages.length - imageLimit);

  Widget imageCard(String imageUrl,
      {int? imageCount, bool isFinalImage = false}) {
    double doublePadding = 10;
    return Padding(
      padding: EdgeInsets.only(
          left: doublePadding,
          right: (isFinalImage || imageCount != null) ? doublePadding : 0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: SizedBox(
          width: imageSize,
          height: imageSize,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
              ),
              if (imageCount != null)
                Center(
                  child: Text(
                    '+$imageCount',
                    style: TypographyStyle.bodyBlackLarge.copyWith(
                        color: white,
                        fontSize: 20,
                        shadows: [
                          Shadow(
                            offset: Offset(1, 2), // Desplazamiento en x y y
                            blurRadius: 8, // Radio de desenfoque
                            color: Colors.black
                                .withOpacity(0.8), // Color de la sombra
                          ),
                        ],
                        fontWeight: FontWeight.w700),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
