import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RemoteConfigController extends GetxController {
  late FirebaseRemoteConfig remoteConfig;
  StreamSubscription? subscription;

  // Variables observables
  var maintenance = false.obs;
  var forceUpdate = '0'.obs;
  var lastVersion = '0'.obs;

  @override
  void onInit() {
    super.onInit();
    initialize();
    listenData();
  }

  @override
  void onClose() {
    // Cancelar la suscripción al listener al descartar el controlador
    subscription?.cancel();
    super.onClose();
  }

  Future<void> initialize() async {
    try {
      remoteConfig = FirebaseRemoteConfig.instance;

      // Configuración inicial de Remote Config
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval:
              Duration.zero, // Forzar obtención desde el servidor
        ),
      );

      // Establecer valores predeterminados
      await remoteConfig.setDefaults({
        'maintenance': false,
        'force_update': '0',
        'last_version': '0',
      });

      // Obtener y activar los valores remotos
      await remoteConfig.fetchAndActivate();

      // Actualizar las variables observables
      maintenance.value = remoteConfig.getBool('maintenance');
      forceUpdate.value = remoteConfig.getString('force_update');
      lastVersion.value = remoteConfig.getString('last_version');
    } on PlatformException catch (exception) {
      // Manejo de excepciones
      print('Error en initialize(): $exception');
    } catch (exception) {
      print('Error en initialize(): $exception');
    }
  }

  Future<void> listenData() async {
    try {
      // Cancelar suscripciones anteriores si existen
      if (subscription != null) {
        await subscription!.cancel();
        subscription = null;
      }

      // Escuchar actualizaciones en tiempo real
      subscription = remoteConfig.onConfigUpdated.listen((event) async {
        // Activar los nuevos valores
        await remoteConfig.activate();
        maintenance.value = remoteConfig.getBool('maintenance');
        forceUpdate.value = remoteConfig.getString('force_update');
        lastVersion.value = remoteConfig.getString('last_version');
      });
    } on PlatformException catch (exception) {
      print('Error en listenData(): $exception');
    } catch (exception) {
      print('Error en listenData(): $exception');
    }
  }
}
