// remote_config_controller.dart
import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_estrellas/app/config/features/features_values.dart';
import 'package:get/get.dart';
import '../../../config/features/features.dart';
import '../../../services/environment.dart';
import 'remote_config_variable.dart';

class RemoteConfigController extends GetxController {
  late FirebaseRemoteConfig _remoteConfig;
  StreamSubscription? _subscription;
  // RemoteConfigUpdate? update;

  // Mapa para almacenar los valores de configuración
  final _configValues = <String, dynamic>{}.obs;
  RxBool skipVersionBool = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initialize();
    _listenData();
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  Map<String, dynamic> getAllConfigValues() {
    return _configValues;
  }

  Future<void> _initialize() async {
    try {
      _remoteConfig = FirebaseRemoteConfig.instance;

      // Configuración inicial de Remote Config
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );

      // Establecer valores predeterminados
      Map<String, dynamic> defaultValues = {};
      for (var variable in remoteConfigVariables) {
        defaultValues[variable.name] = variable.defaultValue;
      }
      await _remoteConfig.setDefaults(defaultValues);

      // Obtener y activar los valores remotos
      await _remoteConfig.fetchAndActivate();

      // Actualizar las variables de configuración
      _updateConfigValues();
    } catch (exception) {
      print('Error en _initialize(): $exception');
    }
  }

  Future<void> _listenData() async {
    try {
      if (_subscription != null) {
        await _subscription!.cancel();
        _subscription = null;
      }

      _subscription = _remoteConfig.onConfigUpdated.listen((event) async {
        await _remoteConfig.activate();

        // update = event;
        _updateConfigValues();
      });
    } catch (exception) {
      print('Error en _listenData(): $exception');
    }
  }

  void _updateConfigValues() {
    for (var variable in remoteConfigVariables) {
      dynamic value;
      switch (variable.valueType) {
        case RemoteConfigValueType.boolType:
          value = _remoteConfig.getBool(variable.name);
          break;
        case RemoteConfigValueType.stringType:
          value = _remoteConfig.getString(variable.name);
          break;
        case RemoteConfigValueType.intType:
          value = _remoteConfig.getInt(variable.name);
          break;
        case RemoteConfigValueType.doubleType:
          value = _remoteConfig.getDouble(variable.name);
          break;
      }
      _configValues[variable.name] = value;
    }
  }

  // Método para obtener el valor de una variable por su nombre en Flutter
  T getValue<T>(String variableName) {
    return _configValues[variableName] as T;
  }

  // Método para verificar si una característica está habilitada
  bool checkFeature(Features feature) {
    final value = _configValues[feature.name];
    if (value is bool) {
      return value;
    }
    return false;
  }

  bool checkNewVersion() {
    String? lastVersion = _configValues[Features.lastVersion.name];
    String currentVersion = Environment.instance.version.toString();

    if (!skipVersionBool.value) {
      if (lastVersion != null) {
        if (lastVersion != '0') {
          lastVersion = lastVersion.replaceAll('.', '').trim();
          currentVersion = currentVersion.replaceAll('.', '').trim();
          int dblLastVersion = int.tryParse(lastVersion) ?? 0;
          int dblCurrentVersion = int.tryParse(currentVersion) ?? 0;

          return dblLastVersion > dblCurrentVersion;
        }
      }
    }

    return false;
  }

  bool checkForceUpdate() {
    String? forceUpdate = _configValues[Features.forceUpdate.name];
    String currentVersion = Environment.instance.version.toString();

    if (forceUpdate != null) {
      if (forceUpdate != '0') {
        forceUpdate = forceUpdate.replaceAll('.', '').trim();
        currentVersion = currentVersion.replaceAll('.', '').trim();
        int dblCurrentVersion = int.tryParse(currentVersion) ?? 0;
        int dblforceUpdate = int.tryParse(forceUpdate) ?? 0;

        return dblforceUpdate > dblCurrentVersion;
      }
    }

    return false;
  }

  void skipVersion() {
    skipVersionBool.value = true;
  }
}
