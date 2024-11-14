import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../themes/styles/typography.dart';
import '../controllers/new_register_controller.dart';

class CheckPasswordCard extends StatelessWidget {
  const CheckPasswordCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewRegisterController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Tu contraseña debe tener:',
              style: TypographyStyle.bodyBlackLarge.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Obx(() => iconComprobation(
                  'Entre 8 y 20 caracteres',
                  controller.hasBetween8and20characters.value,
                )),
            SizedBox(height: 10),
            Obx(() => iconComprobation(
                  '1 mayúscula',
                  controller.hasCapitalLetter.value,
                )),
            SizedBox(height: 10),
            Obx(() => iconComprobation(
                  '1 o más números',
                  controller.hasNumber.value,
                )),
            SizedBox(height: 10),
            Obx(() => iconComprobation(
                  '1 o más caracteres especiales',
                  controller.hasSpecialCharacters.value,
                )),
          ],
        );
      },
    );
  }

  Widget iconComprobation(String text, bool? value) {
    return Row(
      children: [
        SvgPicture.asset(
          value == null
              ? 'assets/svg/icon-check.svg'
              : (value
                  ? 'assets/svg/icon-check-ok.svg'
                  : 'assets/svg/icon-cancel.svg'),
          width: 22,
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: TypographyStyle.bodyRegularLarge,
        )
      ],
    );
  }
}
