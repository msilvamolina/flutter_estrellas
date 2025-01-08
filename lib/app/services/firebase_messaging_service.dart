import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_estrellas/app/data/providers/local/local_storage.dart';
import 'package:get/get.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final LocalStorage localStorage = Get.find<LocalStorage>();

  Future<void> initializeFirebaseMessaging() async {
    await _requestPermission();

    String? token = await _firebaseMessaging.getToken();
    if (token != null) {
      localStorage.setToken(token);
      print("Token de notificación: $token");
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Mensaje recibido en primer plano: ${message.notification?.title}');
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Permiso concedido');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('Permiso provisional concedido');
    } else {
      print('Permiso denegado');
    }
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print('Mensaje recibido en segundo plano: ${message.notification?.title}');
  }
}
