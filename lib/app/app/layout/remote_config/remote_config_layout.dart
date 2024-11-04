import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'remote_config_controller.dart';

class RemoteConfigLayout extends StatelessWidget {
  const RemoteConfigLayout({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final RemoteConfigController controller =
        Get.find<RemoteConfigController>();

    return Obx(() {
      // Verificar si está en modo mantenimiento
      if (controller.isFeatureEnabled('maintenance')) {
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
          title: const Text('RemoteConfigLayout'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Mostrar todas las variables dinámicamente
              ...controller.getAllConfigValues().entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${entry.key}: ${entry.value}',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              SizedBox(height: 20),
              // Puedes agregar aquí el widget 'child' si lo necesitas
              // child,
            ],
          ),
        ),
      );
    });
  }
}
