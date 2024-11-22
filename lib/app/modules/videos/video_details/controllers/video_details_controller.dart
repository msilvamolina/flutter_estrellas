import 'package:get/get.dart';

import '../../../../data/models/videos/video_post_model.dart';

class VideoDetailsController extends GetxController {
  late VideoPostModel videoPostModel;

  @override
  void onInit() {
    videoPostModel = Get.arguments as VideoPostModel;

    super.onInit();
  }
}
