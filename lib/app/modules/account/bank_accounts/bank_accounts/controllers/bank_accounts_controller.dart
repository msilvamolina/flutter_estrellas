import 'package:dartz/dartz.dart';
import 'package:flutter_estrellas/app/data/models/bank_account/bank_account_model.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/bank_accounts/bank_accounts.dart';
import 'package:get/get.dart';

import '../../../../../app/controllers/main_controller.dart';
import '../../../../../components/snackbars/snackbars.dart';
import '../../../../../routes/app_pages.dart';

class BankAccountsController extends GetxController {
  MainController mainController = Get.find<MainController>();

  final BankAccountsRepository _repository = BankAccountsRepository();

  final RxList<BankAccountModel> _list = <BankAccountModel>[].obs;
  List<BankAccountModel> get list => _list.toList();

  Rxn<BankAccountModel> selectedAddress = Rxn<BankAccountModel>();
  Rxn<BankAccountModel> mainAddress = Rxn<BankAccountModel>();

  @override
  void onInit() {
    _list.bindStream(_repository.getUserBankAccounts());
    super.onInit();
  }

  void selectAddress(BankAccountModel address) {
    selectedAddress.value = address;
    mainAddress.value = address;
  }

  Future<void> removeAccount(BankAccountModel bankAccountModel) async {
    Either<String, Unit> response =
        await _repository.removeBankAccount(id: bankAccountModel.id);

    response.fold(
      (failure) {
        Snackbars.error(failure);
      },
      (_) {
        Snackbars.success('Tu cuenta se eliminó correctamente');
      },
    );
    update(['account_view']);
  }
}
