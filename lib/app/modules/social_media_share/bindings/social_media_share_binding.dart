import 'package:get/get.dart';

import '../controllers/social_media_share_controller.dart';

class SocialMediaShareBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SocialMediaShareController>(
      SocialMediaShareController(),
    );
  }
}
