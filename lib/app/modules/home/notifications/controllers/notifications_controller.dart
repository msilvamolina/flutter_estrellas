import 'package:get/get.dart';

import '../../../../controllers/main_controller.dart';

class NotificationsController extends GetxController {
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  MainController mainController = Get.find();

  @override
  void onInit() {
    print('NotificationsController init');
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(Duration(seconds: 1), () {
      _isLoading = false;
      update(['view']);
    });
    super.onReady();
  }
}
