import 'package:flutter/widgets.dart';
import 'package:flutter_estrellas/app/modules/main/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../app/controllers/user_product_controller.dart';
import '../../../../data/models/videos/video_post_model.dart';

class SearchViewController extends GetxController {
  MainController mainController = Get.find<MainController>();
  HomeController homeController = Get.find<HomeController>();
  UserProductController userProductController =
      Get.find<UserProductController>();

  final RxList<VideoPostModel> _filteredList = <VideoPostModel>[].obs;
  final TextEditingController searchController = TextEditingController();

  RxBool showCancelButton = false.obs;
  List<VideoPostModel> get filteredList => _filteredList;

  @override
  void onInit() {
    super.onInit();
    _filteredList.assignAll(homeController.list);
  }

  void filterList(String query) {
    if (query.isEmpty) {
      showCancelButton.value = false;
      _filteredList.assignAll(homeController.list);
    } else {
      showCancelButton.value = true;

      _filteredList.assignAll(
        homeController.list
            .where((item) =>
                item.searchField!.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
