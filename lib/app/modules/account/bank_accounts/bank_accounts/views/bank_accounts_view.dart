import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';

import 'package:get/get.dart';

import '../../../../../components/buttons/buttons.dart';
import '../../../../../routes/app_pages.dart';
import '../controllers/bank_accounts_controller.dart';
import '../widgets/bank_account_card.dart';
import '../widgets/bank_account_empty_state.dart';

class BankAccountsView extends GetView<BankAccountsController> {
  const BankAccountsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstrellasAppbar(title: 'Cuentas bancarias'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => controller.list.isNotEmpty
                  ? ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.list.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () =>
                              controller.selectAddress(controller.list[index]),
                          child: BankAccountCard(
                            bankAccountModel: controller.list[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 24),
                    )
                  : BankAccountEmptyState(),
            ),
            Button(
              label: 'Agregar nueva cuenta',
              onPressed: () {
                Get.toNamed(Routes.NEW_BANK_ACCOUNT);
              },
              style: ButtonStyles.secondaryLink,
            ),
            SizedBox(height: 140),
          ],
        ),
      ),
    );
  }
}
