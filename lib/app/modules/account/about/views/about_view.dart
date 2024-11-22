import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import 'package:get/get.dart';

import '../controllers/about_controller.dart';
import '../widgets/faq_expanded_card.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstrellasAppbar(title: 'Acerca de Estrellas'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Términos y condiciones',
                style: TypographyStyle.h3Mobile,
              ),
              SizedBox(height: 8),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: TypographyStyle.bodyRegularMedium,
              ),
              SizedBox(height: 26),
              FaqExpandedCard(),
              SizedBox(height: 26),
              FaqExpandedCard(),
              SizedBox(height: 26),
              FaqExpandedCard(),
              SizedBox(height: 26),
              FaqExpandedCard(),
              SizedBox(height: 26),
              FaqExpandedCard(),
              SizedBox(height: 26),
              FaqExpandedCard(),
              SizedBox(height: 26),
              FaqExpandedCard(),
              SizedBox(height: 26),
              FaqExpandedCard(),
              SizedBox(height: 26),
              FaqExpandedCard(),
            ],
          ),
        ),
      ),
    );
  }
}
