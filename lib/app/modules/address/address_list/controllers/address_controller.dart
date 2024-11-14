import 'package:flutter_estrellas/app/data/models/address/address_model.dart';
import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../app/controllers/user_product_controller.dart';
import '../../../../data/providers/repositories/address/address_repository.dart';

class AddressController extends GetxController {
  MainController mainController = Get.find();
  UserProductController userProductController =
      Get.find<UserProductController>();
  final AddressRepository _repository = AddressRepository();

  final RxList<AddressModel> _list = <AddressModel>[].obs;
  List<AddressModel> get list => _list.toList();

  Rxn<AddressModel> selectedAddress = Rxn<AddressModel>();
  Rxn<AddressModel> mainAddress = Rxn<AddressModel>();

  @override
  void onInit() {
    _list.bindStream(_repository.getUserAddress());
    super.onInit();
  }

  void selectAddress(AddressModel address) {
    selectedAddress.value = address;
    mainAddress.value = address;
  }
}
