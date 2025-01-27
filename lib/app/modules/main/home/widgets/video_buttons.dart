import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/services/theme_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../data/models/videos/video_post_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';

class VideoButtons extends StatefulWidget {
  VideoButtons(
      {required this.videoPostModel,
      this.imageIsDark,
      super.key,
      this.buttonInsideVideo = false});
  final bool buttonInsideVideo;
  final bool? imageIsDark;
  final VideoPostModel videoPostModel;

  @override
  State<VideoButtons> createState() => _VideoButtonsState();
}

class _VideoButtonsState extends State<VideoButtons> {
  UserProductController userProductController =
      Get.find<UserProductController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        SizedBox(height: 22),
        GetBuilder<UserProductController>(
            id: 'product_catalog_icon',
            builder: (_) {
              return buttonCard(
                onTap: () => userProductController
                    .productCatalogButton(widget.videoPostModel),
                iconSize: userProductController
                        .isProductInCatalogPrivate(widget.videoPostModel)
                    ? 22
                    : 34,
                image: userProductController
                        .isProductInCatalogPrivate(widget.videoPostModel)
                    ? 'assets/svg/catalog.svg'
                    : 'assets/svg/SaveFIll.svg',
                label: 'Guardar',
                colorIcon: userProductController
                        .isProductInCatalogPrivate(widget.videoPostModel)
                    ? null
                    : white,
              );
            }),
        SizedBox(height: 22),
        buttonCard(
            onTap: () => userProductController.mainController.actionNeedLogin(
                () => Get.toNamed(Routes.PRODUCT_DETAILS,
                    arguments: widget.videoPostModel)),
            image: 'assets/svg/InfoFill.svg',
            label: 'Info'),
        SizedBox(height: 22),
        GetBuilder<UserProductController>(
          id: 'product_favorite_icon',
          builder: (_) {
            return buttonCard(
              onTap: () => userProductController
                  .productFavoriteButton(widget.videoPostModel),
              image: userProductController
                      .isProductInFavorites(widget.videoPostModel)
                  ? 'assets/svg/HeartColor.svg'
                  : 'assets/svg/HeartFill.svg',
              label: userProductController.getLikes(widget.videoPostModel),
              colorIcon: white,
            );
          },
        ),
        SizedBox(height: 12),
        GetBuilder<UserProductController>(
            id: 'product_cart_icon',
            builder: (_) {
              return buttonCard(
                iconSize: 50,
                paddingLeft: 4,
                onTap: () => userProductController
                    .productCartButton(widget.videoPostModel),
                image: !userProductController
                        .isProductInCart(widget.videoPostModel)
                    ? 'assets/svg/addCart.svg'
                    : 'assets/svg/addCartFilled.svg',
                label: 'Agregar',
                colorIcon: white,
              );
            }),
        SizedBox(height: 24),
        buttonCard(
            onTap: () => userProductController
                .goToBuyUniqueProduct(widget.videoPostModel),
            image: 'assets/svg/ShoppingBagFill.svg',
            label: 'Comprar'),
        SizedBox(height: 22),
        buttonCard(
          onTap: () =>
              userProductController.goToSellProduct(widget.videoPostModel),
          image: 'assets/svg/logo.svg',
          label: 'Vender',
          isLogo: true,
          colorIcon: primaryBase,
        ),
        SizedBox(height: 22),
        buttonCard(
          onTap: () =>
              userProductController.goToReportVideo(widget.videoPostModel),
          image: 'assets/svg/DotsThree.svg',
          isLogo: true,
          colorIcon: white,
        ),
      ],
    );
  }

  Widget buttonCard({
    required Function()? onTap,
    required String image,
    String? label,
    Color? colorIcon = white,
    bool isLogo = false,
    double iconSize = 34,
    double paddingLeft = 0,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 55,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: paddingLeft),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 1, top: 1),
                      child: SvgPicture.asset(
                        image,
                        width: (isLogo ? (iconSize + 6) : iconSize) + 1,
                        colorFilter: colorIcon != null
                            ? ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.srcIn,
                              )
                            : null,
                      ),
                    ),
                    SvgPicture.asset(
                      image,
                      width: isLogo ? (iconSize + 6) : iconSize,
                      colorFilter: colorIcon != null
                          ? ColorFilter.mode(
                              colorIcon,
                              BlendMode.srcIn,
                            )
                          : null,
                    ),
                  ],
                ),
              ),
              if (label != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    label,
                    style: TypographyStyle.bodyBlackMedium.copyWith(
                      color: neutral50,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1), // Desplazamiento en x y y
                          blurRadius: 8, // Radio de desenfoque
                          color: Colors.black
                              .withOpacity(0.8), // Color de la sombra
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
