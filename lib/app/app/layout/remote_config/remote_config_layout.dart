import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'remote_config_controller.dart';

class RemoteConfigLayout extends StatelessWidget {
  const RemoteConfigLayout({required this.child, super.key});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    final RemoteConfigController controller = Get.find();

    return Obx(() {
      // Verificar si está en modo mantenimiento
      if (controller.maintenance.value) {
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
          title: const Text('RemoteConfigView'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '3 Mantenimiento: ${controller.maintenance.value}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '3 Forzar Actualización: ${controller.forceUpdate.value}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '3 Última Versión: ${controller.lastVersion.value}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    });
  }
}
