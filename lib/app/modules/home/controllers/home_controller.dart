import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:get/get.dart';

import '../../../data/models/videos/video_post_model.dart';
import '../../../data/providers/repositories/videos/videos_repository.dart';

class HomeController extends GetxController {
  PageController pageController = PageController();
  MainController mainController = Get.find<MainController>();
  UserProductController userProductController =
      Get.find<UserProductController>();
  final VideosRepository _repository = VideosRepository();

  final RxList<VideoPostModel> _list = <VideoPostModel>[].obs;
  List<VideoPostModel> get list => _list.toList();

  @override
  void onInit() {
    _list.bindStream(_repository.getVideos());
    super.onInit();
  }
}
