import 'package:get/get.dart';

import '../../../../data/models/user_product/user_product_model.dart';

class VideoListController extends GetxController {
  late List<UserProductModel> list;
  late int index;

  @override
  void onInit() {
    list = Get.arguments[0] as List<UserProductModel>;
    index = Get.arguments[1] as int;
    super.onInit();
  }
}
