import 'package:dartz/dartz.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/data/models/bank_account/bank_account_model.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/bank_accounts/bank_accounts.dart';
import 'package:get/get.dart';

import '../../../../../components/snackbars/snackbars.dart';
import '../../../../../data/models/address/address_model.dart';

class NewBankConfirmationController extends GetxController {
  MainController mainController = Get.find<MainController>();
  BankAccountsRepository _repository = BankAccountsRepository();

  late BankAccountModel bankAccountModel;

  @override
  void onInit() {
    bankAccountModel = Get.arguments as BankAccountModel;
    super.onInit();
  }

  Future<void> save() async {
    mainController.showLoader(
      title: 'Guardando cuenta bancaria',
    );

    Either<String, Unit> response =
        await _repository.addBankAccount(bankAccount: bankAccountModel);
    Get.back();
    response.fold((failure) {
      Snackbars.error(failure);
    }, (_) async {
      Get.back();
      Get.back();
      Snackbars.success('Tu cuenta bancaria se agregó exitosamente');
    });
  }
}
