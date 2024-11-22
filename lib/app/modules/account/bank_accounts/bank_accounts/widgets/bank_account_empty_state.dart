import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../components/buttons/buttons.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../themes/styles/colors.dart';
import '../../../../../themes/styles/typography.dart';

class BankAccountEmptyState extends StatelessWidget {
  const BankAccountEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    String image = 'assets/images/catalog.png';
    return Stack(
      children: [
        Positioned(
          right: -130,
          top: 0,
          child: Opacity(
            opacity: 0.3,
            child: Image.asset(
              image,
              width: 320,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              Image.asset(
                image,
                width: 80,
              ),
              SizedBox(height: 20),
              Text(
                'No tienes una cuenta agregada',
                style: TypographyStyle.bodyBlackLarge
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              SizedBox(height: 8),
              Text(
                'Agrega tu cuenta bancaria para empezar a recibir tus ganancias, ¡es rápido y fácil!',
                style: TypographyStyle.bodyRegularLarge.copyWith(),
              ),
              SizedBox(height: 22),
              Center(
                child: Button(
                  label: 'Agregar nueva cuenta',
                  onPressed: () {
                    Get.toNamed(Routes.NEW_BANK_ACCOUNT);
                  },
                  style: ButtonStyles.secondaryLink,
                ),
              ),
              SizedBox(height: 22),
            ],
          ),
        ),
      ],
    );
  }
}
