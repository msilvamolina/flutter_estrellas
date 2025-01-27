import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/modules/main/home/controllers/api.dart';
import 'package:flutter_estrellas/app/modules/main/home/controllers/item.dart';
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

  // final RxList<VideoPostModel> _list = <VideoPostModel>[].obs;
  // List<VideoPostModel> get list => _list.toList();

  final PagingController<int, DocumentSnapshot> pagingController =
      PagingController(
    firstPageKey: 1,
  );
  final PageController pageController = PageController();

  DocumentSnapshot? lastDocument;
  @override
  void onInit() {
    pagingController.addPageRequestListener(_fetchPage);
    super.onInit();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await _repository.getVideosFutureDocument(pageKey,
          lastDocument: lastDocument);

      lastDocument = newItems.last;
      final isLastPage = newItems.isEmpty;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
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
