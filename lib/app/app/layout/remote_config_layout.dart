import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RemoteConfigLayout extends StatefulWidget {
  const RemoteConfigLayout({super.key, required this.child});
  final Widget child;

  @override
  State<RemoteConfigLayout> createState() => _RemoteConfigLayoutState();
}

class _RemoteConfigLayoutState extends State<RemoteConfigLayout> {
  late FirebaseRemoteConfig remoteConfig;
  StreamSubscription? subscription;
  RemoteConfigUpdate? update;
  bool maintenance = false;
  String forceUpdate = '0';
  String lastVersion = '0';

  @override
  void initState() {
    super.initState();
    initialize();
    listenData();
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

      // Actualizar las variables con los valores obtenidos
      setState(() {
        maintenance = remoteConfig.getBool('maintenance');
        forceUpdate = remoteConfig.getString('force_update');
        lastVersion = remoteConfig.getString('last_version');
      });
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

        // Actualizar las variables y la interfaz de usuario
        setState(() {
          update = event;
          maintenance = remoteConfig.getBool('maintenance');
          forceUpdate = remoteConfig.getString('force_update');
          lastVersion = remoteConfig.getString('last_version');
        });
      });
    } on PlatformException catch (exception) {
      print('Error en listenData(): $exception');
    } catch (exception) {
      print('Error en listenData(): $exception');
    }
  }

  @override
  void dispose() {
    // Cancelar la suscripción al listener al descartar el widget
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Verificar si está en modo mantenimiento
    if (maintenance) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Mantenimiento'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'La aplicación está en mantenimiento. Por favor, vuelve más tarde.',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    // Si no está en mantenimiento, mostrar el contenido normal
    return Scaffold(
      appBar: AppBar(
        title: const Text('RemoteConfigLayoutView'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Mantenimiento: $maintenance',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Forzar Actualización: $forceUpdate',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Última Versión: $lastVersion',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Text(
            update != null
                ? 'Claves actualizadas: ${update?.updatedKeys.join(', ')}'
                : 'Sin actualizaciones',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
