import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/step_indicator/step_indicator.dart';
import 'package:flutter_estrellas/app/data/models/carrousel/carrousel_model.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../app/dialogs/welcome/welcome_screen.dart';
import '../../../../components/buttons/buttons.dart';
import '../../../../components/layouts/auth_layout.dart';
import '../controllers/welcome_controller.dart';
import '../widgets/carrousel_card.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Button(
                style: ButtonStyles.secondaryLink,
                onPressed: controller.skip,
                label: 'Saltar',
              ),
              Spacer(),
              Button(
                onPressed: controller.next,
                style: ButtonStyles.secondaryCirlce,
                child: CircleAvatar(
                  backgroundColor: primaryBase,
                  radius: 24,
                  child: Icon(
                    EstrellasIcons.arrowCompleteRight,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(16),
                child: StepIndicator(
                  currentStep: controller.currentStep.value + 1,
                  totalSteps: controller.list.length,
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: SvgPicture.asset(
                'assets/svg/fulllogo.svg',
                width: 150,
              ),
            ),
            SizedBox(height: 32),
            Expanded(
              child: PageView(
                onPageChanged: controller.onPageChanged,
                controller: controller.pageController,
                children: [
                  for (CarrouselModel element in controller.list)
                    CarrouselCard(element: element),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
