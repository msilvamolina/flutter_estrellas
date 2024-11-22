import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import 'package:get/get.dart';

import '../../../../../components/buttons/buttons.dart';
import '../controllers/new_bank_confirmation_controller.dart';

class NewBankConfirmationView extends GetView<NewBankConfirmationController> {
  const NewBankConfirmationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstrellasAppbar(title: 'Verifica tus datos'),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Button(
            label: 'Agregar cuenta',
            style: ButtonStyles.primary,
            onPressed: controller.save,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      EstrellasIcons.bank,
                      size: 32,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: Get.back,
                      icon: Icon(
                        EstrellasIcons.pencilSimple,
                        color: secondaryBase,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                nameCard('Banco', controller.bankAccountModel.bank),
                SizedBox(height: 16),
                nameCard(
                    controller.bankAccountModel.accountType == 'savings'
                        ? 'Cuenta de Ahorros'
                        : 'Cuenta Corriente',
                    controller.bankAccountModel.accountNumber),
                SizedBox(height: 16),
                nameCard(
                    'Nombre del titular', controller.bankAccountModel.fullname),
                SizedBox(height: 16),
                nameCard('Tipo de documento',
                    controller.bankAccountModel.documentType),
                SizedBox(height: 16),
                nameCard('Documento', controller.bankAccountModel.document),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget nameCard(String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TypographyStyle.bodyRegularLarge,
        ),
        Text(
          subtitle,
          style: TypographyStyle.bodyBlackLarge,
        ),
      ],
    );
  }
}
