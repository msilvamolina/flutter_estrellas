import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/providers/local/local_storage.dart';

class DependecyInjection {
  static void init() {
    Get.put<GetStorage>(GetStorage());
    Get.put<LocalStorage>(LocalStorage());
    Get.put<FirebaseFirestore>(FirebaseFirestore.instance);
    Get.put<FirebaseStorage>(FirebaseStorage.instance);
  }
}
