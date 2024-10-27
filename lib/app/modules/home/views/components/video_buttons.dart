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
        buttonCard(
            onTap: () => userProductController
                .showBottomSheetCatalog(widget.videoPostModel.product),
            image: 'assets/svg/SaveFIll.svg',
            label: 'Guardar'),
        SizedBox(height: 22),
        buttonCard(
            onTap: () => Get.toNamed(Routes.PRODUCT,
                arguments: widget.videoPostModel.product),
            image: 'assets/svg/InfoFill.svg',
            label: 'Info'),
        SizedBox(height: 22),
        buttonCard(
            onTap: () => userProductController
                .addToFavorites(widget.videoPostModel.product),
            image: 'assets/svg/HeartFill.svg',
            label: '220'),
        SizedBox(height: 22),
        buttonCard(
            onTap: () => userProductController
                .goToBuyUniqueProduct(widget.videoPostModel.product),
            image: 'assets/svg/ShoppingBagFill.svg',
            label: 'Comprar'),
        SizedBox(height: 22),
        buttonCard(
          onTap: () => userProductController
              .goToBuyUniqueProduct(widget.videoPostModel.product),
          image: 'assets/svg/logo.svg',
          label: 'Vender',
          isLogo: true,
        ),
      ],
    );
  }

  Widget buttonCard({
    required Function()? onTap,
    required String image,
    required String label,
    bool isLogo = false,
  }) {
    MainController mainController = Get.find();
    Color colorText = widget.buttonInsideVideo
        ? white
        : (mainController.isThemeModeDark ? white : neutral800);

    Color colorIcon = widget.buttonInsideVideo
        ? white
        : (mainController.isThemeModeDark ? white : neutral500);
    double iconSize = 34;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 55,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                          0.1), // Menor opacidad para una sombra más sutil
                      offset: Offset(0.5, 0.5), // Sombra más cercana al ícono
                      blurRadius: 4, // Menor desenfoque
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  image,
                  width: isLogo ? (iconSize + 6) : iconSize,
                  colorFilter: ColorFilter.mode(
                    isLogo ? primaryBase : colorIcon,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(
                label,
                style: TypographyStyle.bodyBlackMedium.copyWith(
                  color: neutral50,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1), // Desplazamiento en x y y
                      blurRadius: 8, // Radio de desenfoque
                      color:
                          Colors.black.withOpacity(0.8), // Color de la sombra
                    ),
                  ],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
