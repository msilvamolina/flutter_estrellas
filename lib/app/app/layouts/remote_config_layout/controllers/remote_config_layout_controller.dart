import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';

class RemoteConfigLayoutController extends GetxController {
  RxBool isMaintenanceMode = false.obs;
  FirebaseRemoteConfig remoteConfig = Get.find();

  @override
  Future<void> onInit() async {
    _setupRemoteConfig();

    super.onInit();
  }

  void _setupRemoteConfig() async {
    // await remoteConfig.setConfigSettings(
    //   RemoteConfigSettings(
    //     fetchTimeout: const Duration(seconds: 10),
    //     minimumFetchInterval: const Duration(hours: 1),
    //   ),
    // );
    await remoteConfig.setDefaults(<String, dynamic>{
      'maintenance': false,
    });
    RemoteConfigValue(null, ValueSource.valueStatic);
    _fetchAndActivate();
  }

  void _fetchAndActivate() async {
    try {
      await remoteConfig.fetchAndActivate();
      // Actualiza el estado del modo de mantenimiento
      isMaintenanceMode.value = remoteConfig.getBool('maintenance');
    } catch (e) {
      print('Error al obtener Remote Config: $e');
    }
  }
}
