import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../data/models/videos/video_post_model.dart';
import '../../../../data/providers/repositories/auth/user_repository.dart';
import '../../../../data/providers/repositories/videos/videos_repository.dart';
import '../../../../services/firebase_messaging_service.dart';

class HomeController extends GetxController {
  UserRepository userRepository = UserRepository();
  // PageController pageController = PageController();
  MainController mainController = Get.find<MainController>();
  UserProductController userProductController =
      Get.find<UserProductController>();
  final VideosRepository _repository = VideosRepository();

  final RxList<VideoPostModel> _list = <VideoPostModel>[].obs;
  List<VideoPostModel> get list => _list.toList();
  final PagingController<int, dynamic> pagingController = PagingController(
    firstPageKey: 1,
  );
  final PageController pageController = PageController();

  @override
  void onInit() {
    _list.bindStream(_repository.getVideos());
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    if (mainController.isUserLogged.value) {
      initFirebaseMessaging();
      await userRepository.saveUserToken();
    }
  }

  Future<void> initFirebaseMessaging() async {
    FirebaseMessagingService firebaseMessagingService =
        FirebaseMessagingService();
    await firebaseMessagingService.initializeFirebaseMessaging();
  }

  void goToCart() {
    mainController.actionNeedLogin(() => Get.toNamed(Routes.CART));
  }
}
