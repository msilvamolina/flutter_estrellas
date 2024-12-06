import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/models/address/address_model.dart';
import '../../../data/models/payments_types/payments_types_model.dart';
import '../../../routes/app_pages.dart';

class PaymentsMethodController extends GetxController {
  late int paymentOrderNumber;
  late AddressModel address;
  late PaymentMethod paymentMethod;
  late String description;
  late double amount;
  late String email;

  late Map<String, String> formData;
  final String url = "https://merchant.paymentsway.co/cartaspago/redirect";

  @override
  void onInit() {
    paymentOrderNumber = Get.arguments[0] as int;
    address = Get.arguments[1] as AddressModel;
    paymentMethod = Get.arguments[2] as PaymentMethod;
    description = Get.arguments[3] as String;
    amount = Get.arguments[4] as double;
    email = Get.arguments[5] as String;

    String fullName = address.fullname ?? '';
    Map<String, String> result = splitName(fullName);

    String firstName = result['firstName'] ?? '';
    String lastName = result['lastName'] ?? '';

    formData = {
      "merchant_id": "2536",
      "form_id": "2585",
      "terminal_id": "1873",
      "order_number": paymentOrderNumber.toString(),
      "amount": amount.toString(),
      "currency": "cop",
      "order_description": description,
      "color_base": "#DE073F",
      "client_email": email,
      "client_phone": address.phone?.number ?? '',
      "client_firstname": firstName,
      "client_lastname": lastName,
      "client_doctype": "4",
      "client_numdoc": '',
      "response_url": "http://www.estrellas.pro/payments/response",
    };

    super.onInit();
  }

  Map<String, String> splitName(String fullName) {
    int spaceIndex = fullName.indexOf(' ');

    if (spaceIndex == -1) {
      // Si no hay espacio, todo es considerado como el nombre
      return {'firstName': fullName, 'lastName': ''};
    }

    String firstName = fullName.substring(0, spaceIndex).trim();
    String lastName = fullName.substring(spaceIndex + 1).trim();

    return {'firstName': firstName, 'lastName': lastName};
  }

  Future<void> onCompleted() async {
    await Get.toNamed(Routes.FINALIZE_ORDER, arguments: [
      paymentOrderNumber,
      address,
      PaymentMethod.delivery,
      amount,
    ]);
  }
}
