import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DialogLayout extends StatelessWidget {
  const DialogLayout({required this.child, super.key});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenWidth < 480;

    return Stack(
      children: [
        GestureDetector(
          onTap: Get.back,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16), // Desenfoque
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.all(isMobile ? 0 : 30),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(isMobile ? 0 : 36)),
            constraints:
                BoxConstraints(maxWidth: isMobile ? double.infinity : 480),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isMobile ? 0 : 20),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
