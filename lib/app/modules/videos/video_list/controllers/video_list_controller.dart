import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/user_product/user_product_model.dart';
import '../../../../data/models/videos/video_post_model.dart';

class VideoListController extends GetxController {
  late List<UserProductModel> list;
  late int index;
  PageController pageController = PageController();
  RxInt pageSelected = 0.obs;

  List<VideoPostModel> listVideos = [];

  @override
  void onInit() {
    list = Get.arguments[0] as List<UserProductModel>;
    index = Get.arguments[1] as int;
    pageSelected.value = index;
    setVideoList();

    super.onInit();
  }

  @override
  void onReady() {
    pageController.animateToPage(
      pageSelected.value,
      duration: Duration(milliseconds: 10),
      curve: Curves.linear,
    );
  }

  void setVideoList() {
    for (UserProductModel element in list) {
      if (element.video != null) {
        listVideos.add(element.video!);
      }
    }
  }

  void setValue(int value) {
    pageSelected.value = value;
  }
}
