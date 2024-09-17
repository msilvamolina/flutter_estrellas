import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../modules/auth/welcome/controllers/welcome_controller.dart';
import '../../../themes/styles/colors.dart';
import 'views/slider_step.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, this.isDialog = false});

  final bool isDialog;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      builder: (controller) {
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
                        color: neutral900,
                        borderRadius: BorderRadius.circular(16)),
                    width: double.infinity,
                    height: 4,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: neutral900,
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
                  child: SliderStep(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.arrow_right_alt_outlined),
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
