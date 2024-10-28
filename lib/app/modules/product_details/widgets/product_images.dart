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

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-ecd61.appspot.com/o/products%2F671923db043d1fc932a5537a%2Fimage-0e457ef7-17d5-4450-81be-9b27ccb18c3c?alt=media&token=7f37296e-bbfe-4c5f-a309-8d1590684514';

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
                  imageCard(imageUrl),
                  imageCard(imageUrl),
                  imageCard(imageUrl),
                  imageCard(imageUrl, imageCount: 6),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget imageCard(String imageUrl, {int? imageCount}) {
    double doublePadding = 10;
    return Padding(
      padding: EdgeInsets.only(
          left: doublePadding, right: imageCount != null ? doublePadding : 0),
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
