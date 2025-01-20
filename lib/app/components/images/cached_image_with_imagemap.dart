import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageWithImagemap extends StatelessWidget {
  const CachedImageWithImagemap({
    super.key,
    this.imageMap,
  });

  final Map<String, String>? imageMap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (imageMap != null)
          for (int i = 0; i < imageMap!.values.length; i++)
            CachedNetworkImage(
              fit: BoxFit.cover,
              width: double.infinity,
              imageUrl: imageMap!.values.elementAt(i),
              placeholder: (context, url) {
                if (i == 0) {
                  return Center(child: CircularProgressIndicator());
                }
                return SizedBox.shrink();
              },
            ),
      ],
    );
  }
}
