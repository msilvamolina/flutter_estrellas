import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import 'package:get/get.dart';

import '../../../../themes/styles/colors.dart';
import '../controllers/login_start_controller.dart';

class LoginStartView extends GetView<LoginStartController> {
  const LoginStartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(''),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'Ayuda',
                    style: TypographyStyle.bodyRegularLarge,
                  ),
                  Icon(
                    EstrellasIcons.question,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: white,
        child: Column(
          children: [
            Image.asset('assets/images/login-background.png'),
          ],
        ),
      ),
    );
  }
}
