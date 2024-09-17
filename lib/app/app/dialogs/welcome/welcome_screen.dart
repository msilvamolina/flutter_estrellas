import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../modules/auth/welcome/controllers/welcome_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../themes/styles/colors.dart';
import 'views/slider_step.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, this.isDialog = false});

  final bool isDialog;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int pagesLenght = 3;
  int currentPage = 1;
  PageController pageController = PageController();

  void nextStep() {
    if (currentPage == 3) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      setState(() {
        currentPage++;
        pageController.animateToPage(currentPage,
            duration: Duration(milliseconds: 200), curve: Curves.linear);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      builder: (controller) {
        Color colorStep =
            controller.mainController.isThemeModeDark ? neutral900 : neutral300;
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: secondaryBase,
                        borderRadius: BorderRadius.circular(16)),
                    width: double.infinity,
                    height: 4,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: currentPage > 1 ? secondaryBase : colorStep,
                        borderRadius: BorderRadius.circular(16)),
                    width: double.infinity,
                    height: 4,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: currentPage > 2 ? secondaryBase : colorStep,
                        borderRadius: BorderRadius.circular(16)),
                    width: double.infinity,
                    height: 4,
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/svg/fulllogo.svg',
                    width: 140,
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: [
                      SliderStep(),
                      SliderStep(),
                      SliderStep(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: nextStep,
                        child: Icon(currentPage == 3
                            ? Icons.check
                            : Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
