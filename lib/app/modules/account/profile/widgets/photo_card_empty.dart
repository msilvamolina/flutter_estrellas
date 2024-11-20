import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';

class PhotoCardEmpty extends StatelessWidget {
  const PhotoCardEmpty({
    super.key,
    this.imageUrl,
    this.networkUrl,
    this.isFull = false,
  });

  final bool isFull;
  final String? imageUrl;
  final String? networkUrl;
  @override
  Widget build(BuildContext context) {
    bool isEmpty = imageUrl == null && networkUrl == null;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomPaint(
          size: Size(100, 100),
          painter: VerticalSplitBorderPainter(isFull: isFull),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(3.5),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isEmpty ? white : null,
                  image: !isEmpty
                      ? (imageUrl != null
                          ? DecorationImage(
                              image: FileImage(
                                File(imageUrl!),
                              ),
                              fit: BoxFit.cover,
                            )
                          : networkUrl != null
                              ? DecorationImage(
                                  image: NetworkImage(networkUrl!),
                                  fit: BoxFit.cover,
                                )
                              : null)
                      : null,
                ),
                alignment: Alignment.center,
                child: isEmpty
                    ? Icon(
                        EstrellasIcons.user,
                        size: 40,
                        color: neutral900,
                      )
                    : SizedBox.shrink(),
              ),
            ),
          ),
        ),
        Positioned(
          top: -10,
          right: -10,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: secondaryLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                EstrellasIcons.camera,
                size: 26,
                color: neutral900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class VerticalSplitBorderPainter extends CustomPainter {
  const VerticalSplitBorderPainter({required this.isFull});

  final bool isFull;
  @override
  void paint(Canvas canvas, Size size) {
    final double borderWidth = 4;

    final borderRadius = BorderRadius.circular(20);
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(24));

    final paintRight = Paint()
      ..color = secondaryBase
      ..strokeWidth = borderWidth;
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRRect(rrect, paintRight);

    if (!isFull) {
      final paintLeft = Paint()
        ..color = secondaryLight
        ..strokeWidth = borderWidth;
      canvas.clipRect(Rect.fromLTWH(0, 0, size.width / 2, size.height));
      canvas.drawRRect(rrect, paintLeft);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
