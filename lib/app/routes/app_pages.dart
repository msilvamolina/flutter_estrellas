import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../modules/home/favorites/pages/favorites_page.dart';
import '../modules/home/home/pages/home_page.dart';
import '../modules/home/messages/pages/messages_page.dart';
import '../modules/home/notifications/pages/notifications_page.dart';
import '../modules/home/user/pages/user_page.dart';
import '../modules/home/home/bindings/home_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;
  static Transition transition =
      kIsWeb ? Transition.noTransition : Transition.native;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.FAVORITES,
      page: () => FavoritesPage(),
      transition: transition,
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => NotificationsPage(),
      transition: transition,
    ),
    GetPage(
      name: _Paths.MESSAGES,
      page: () => MessagesPage(),
      transition: transition,
    ),
    GetPage(
      name: _Paths.USER,
      page: () => UserPage(),
      transition: transition,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
    ),
  ];
}
