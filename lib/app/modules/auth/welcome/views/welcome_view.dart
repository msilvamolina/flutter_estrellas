import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/step_indicator/step_indicator.dart';
import 'package:flutter_estrellas/app/data/models/carrousel/carrousel_model.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../app/dialogs/welcome/welcome_screen.dart';
import '../../../../components/layouts/auth_layout.dart';
import '../controllers/welcome_controller.dart';
import '../widgets/carrousel_card.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(height: 10),
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
