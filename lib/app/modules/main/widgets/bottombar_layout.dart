import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../libraries/icons/icons_font.dart';
import '../../../routes/app_pages.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
import '../home/controllers/home_controller.dart';
import 'bottombar.dart';

class BottombarLayout extends StatelessWidget {
  const BottombarLayout(
      {required this.viewSelected, required this.child, super.key});

  final Widget child;
  final int viewSelected;
  @override
  Widget build(BuildContext context) {
    bool isIos = false;
    bool isAndroid = false;

    if (!kIsWeb) {
      isIos = Platform.isIOS;
      isAndroid = Platform.isAndroid;
    }
    return Stack(
      children: [
        child,
        SafeArea(
          child: SizedBox(
            height: kToolbarHeight,
            child: Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.CART);
                  },
                  icon: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                  0.05), // Sombra con opacidad del 30%
                              offset: Offset(1, 1), // Desplazamiento en x e y
                              blurRadius: 6, // Radio de desenfoque
                            ),
                          ],
                        ),
                        child: Icon(
                          EstrellasIcons.shoppingCartSimpleFill,
                          color: white,
                          size: 40,
                        ),
                      ),
                      GetX<HomeController>(
                        builder: (controller) {
                          return Positioned(
                            right: 0,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: error900,
                              child: Text(
                                controller.userProductController.listProductCart
                                    .length
                                    .toString(),
                                style: TypographyStyle.bodyBlackSmall
                                    .copyWith(color: white, fontSize: 12),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: isAndroid ? 36 : 26,
          left: 16,
          right: 16,
          child: Bottombar(viewSelected: viewSelected),
        ),
      ],
    );
  }
}
