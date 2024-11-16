import 'package:get/get.dart';

class OrderErrorController extends GetxController {
  late String message;
  @override
  void onInit() {
    message = Get.arguments as String;
    super.onInit();
  }
}
