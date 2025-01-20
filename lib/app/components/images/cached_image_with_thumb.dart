import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageWithThumb extends StatelessWidget {
  const CachedImageWithThumb({
    super.key,
    this.thumbnail,
    this.fullImage,
  });

  final String? thumbnail;
  final String? fullImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (thumbnail != null)
          CachedNetworkImage(
            fit: BoxFit.cover,
            width: double.infinity,
            imageUrl: thumbnail!,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
          ),
        if (fullImage != null)
          CachedNetworkImage(
            fit: BoxFit.cover,
            width: double.infinity,
            imageUrl: fullImage!,
          ),
      ],
    );
  }
}
