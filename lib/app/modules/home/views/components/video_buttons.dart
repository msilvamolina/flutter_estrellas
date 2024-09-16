import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/services/theme_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';

class VideoButtons extends StatelessWidget {
  VideoButtons({super.key, this.buttonInsideVideo = false});
  final bool buttonInsideVideo;

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();
    Color colorText = buttonInsideVideo
        ? white
        : (ThemeService.isDark() ? white : neutral800);

    Color colorIcon = buttonInsideVideo
        ? white
        : (ThemeService.isDark() ? white : neutral500);
    double iconSize = 34;
    return Column(
      children: [
        Spacer(),
        InkWell(
          onTap: mainController.openLoginDialog,
          child: SvgPicture.asset(
            'assets/svg/BookmarkSimple.svg',
            width: iconSize,
            colorFilter: ColorFilter.mode(
              colorIcon,
              BlendMode.srcIn,
            ),
          ),
        ),
        SizedBox(height: 4),
        Text('Guardar',
            style: TypographyStyle.bodyRegularSmall.copyWith(color: colorText)),
        SizedBox(height: 22),
        SvgPicture.asset(
          'assets/svg/Info.svg',
          width: iconSize,
          colorFilter: ColorFilter.mode(
            colorIcon,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(height: 4),
        Text('Info',
            style: TypographyStyle.bodyRegularSmall.copyWith(color: colorText)),
        SizedBox(height: 22),
        SvgPicture.asset(
          'assets/svg/Heart.svg',
          width: iconSize,
          colorFilter: ColorFilter.mode(
            colorIcon,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(height: 4),
        Text('220',
            style: TypographyStyle.bodyRegularSmall.copyWith(color: colorText)),
        SizedBox(height: 22),
        SvgPicture.asset(
          'assets/svg/ShoppingBag.svg',
          width: iconSize,
          colorFilter: ColorFilter.mode(
            colorIcon,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(height: 4),
        Text('Comprar',
            style: TypographyStyle.bodyRegularSmall.copyWith(color: colorText)),
        SizedBox(height: 22),
        SvgPicture.asset(
          'assets/svg/logo.svg',
          width: iconSize,
        ),
        SizedBox(height: 4),
        Text('Vender',
            style: TypographyStyle.bodyRegularSmall.copyWith(color: colorText)),
      ],
    );
  }
}
