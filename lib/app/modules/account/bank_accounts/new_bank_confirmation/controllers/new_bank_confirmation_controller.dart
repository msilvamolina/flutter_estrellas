import 'package:flutter_estrellas/app/data/models/bank_account/bank_account_model.dart';
import 'package:get/get.dart';

class NewBankConfirmationController extends GetxController {
  late BankAccountModel bankAccountModel;

  @override
  void onInit() {
    bankAccountModel = Get.arguments as BankAccountModel;
    super.onInit();
  }

  void save() {}
}
