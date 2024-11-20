import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../app/controllers/main_controller.dart';
import '../app/controllers/user_product_controller.dart';
import '../app/layout/remote_config/remote_config_controller.dart';
import '../data/providers/local/local_storage.dart';

class DependecyInjection {
  static void init() {
    try {
      Get.put<GetStorage>(GetStorage());
      Get.put<LocalStorage>(LocalStorage());
      Get.put<FirebaseRemoteConfig>(FirebaseRemoteConfig.instance);
      Get.put<FirebaseFirestore>(FirebaseFirestore.instance);
      Get.put<FirebaseStorage>(FirebaseStorage.instance);
      Get.put<MainController>(MainController());
      Get.put(RemoteConfigController());
      Get.put<UserProductController>(UserProductController());
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace,
          reason: "Error en DependecyInjection.init");
    }
  }
}
