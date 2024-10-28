import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../data/models/product_image/product_image_model.dart';

class ProductImagesCard extends StatelessWidget {
  const ProductImagesCard({required this.listImages, super.key});
  final List<ProductImageModel> listImages;
  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-ecd61.appspot.com/o/products%2F671923db043d1fc932a5537a%2Fimage-0e457ef7-17d5-4450-81be-9b27ccb18c3c?alt=media&token=7f37296e-bbfe-4c5f-a309-8d1590684514';
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      margin: const EdgeInsets.all(26),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // for (int index = 0;
          //     index < listImages.length && index < 4;
          //     index++) ...[
          Expanded(
            child: imageCard(imageUrl),
          ),
          Expanded(
            child: imageCard(imageUrl),
          ),
          Expanded(
            child: imageCard(imageUrl),
          ),
          Expanded(
            child: imageCard(imageUrl),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget imageCard(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}
