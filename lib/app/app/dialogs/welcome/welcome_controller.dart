import 'package:get/get.dart';

import '../../controllers/main_controller.dart';

class WelcomeController extends GetxController {
  MainController mainController = Get.find();
  bool _buttonEnabled = true;
  bool get buttonEnabled => _buttonEnabled;
}
