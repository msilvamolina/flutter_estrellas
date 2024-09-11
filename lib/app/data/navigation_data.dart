import 'package:flutter/material.dart';

import '../modules/home/favorites/views/favorites_view.dart';
import '../modules/home/home/views/home_view.dart';
import '../modules/home/messages/views/messages_view.dart';
import '../modules/home/notifications/views/notifications_view.dart';
import '../modules/home/user/views/user_view.dart';
import '../routes/app_pages.dart';

class NavigationData {
  static List<Map> leftOptions() => [
        <String, dynamic>{
          'icon': Icons.mobiledata_off_outlined,
          'text': 'Amigos',
        },
        <String, dynamic>{
          'icon': Icons.abc_sharp,
          'text': 'Recuerdos',
        },
        <String, dynamic>{
          'icon': Icons.new_label_rounded,
          'text': 'Guardado',
        },
        <String, dynamic>{
          'icon': Icons.aspect_ratio_outlined,
          'text': 'Grupos',
        },
        <String, dynamic>{
          'icon': Icons.apps_outlined,
          'text': 'Eventos',
        }
      ];
  static List<Map> leftOptions2() => [
        <String, dynamic>{
          'icon': Icons.mobiledata_off_outlined,
          'text': 'Actividad publicitaria reciente',
        },
        <String, dynamic>{
          'icon': Icons.abc_sharp,
          'text': 'Administrador de anuncios',
        },
        <String, dynamic>{
          'icon': Icons.new_label_rounded,
          'text': 'Clima',
        },
        <String, dynamic>{
          'icon': Icons.aspect_ratio_outlined,
          'text': 'Jugar',
        },
        <String, dynamic>{
          'icon': Icons.apps_outlined,
          'text': 'Paginas',
        }
      ];
  static List<Widget> getViews() => <Widget>[
        HomeView(),
        NotificationsView(),
        MessagesView(),
        FavoritesView(),
        UserView(),
      ];
  static List<Map> getData() => [
        <String, dynamic>{
          'index': 0,
          'route': Routes.HOME,
          'text': 'Home',
          'icon': Icons.home,
          'selectedIcon': Icons.home,
          'badge': false,
          'badgeText': null,
        },
        <String, dynamic>{
          'index': 1,
          'route': Routes.NOTIFICATIONS,
          'text': 'Notifications',
          'icon': Icons.notifications_sharp,
          'selectedIcon': Icons.notifications_sharp,
          'badge': true,
          'badgeText': '9',
        },
        <String, dynamic>{
          'index': 2,
          'route': Routes.MESSAGES,
          'text': 'Messages',
          'icon': Icons.messenger_sharp,
          'selectedIcon': Icons.messenger_sharp,
          'badge': true,
          'badgeText': '9',
        },
        <String, dynamic>{
          'index': 3,
          'route': Routes.FAVORITES,
          'text': 'favorites',
          'icon': Icons.favorite,
          'selectedIcon': Icons.favorite,
          'badge': false,
          'badgeText': null,
        },
        <String, dynamic>{
          'index': 4,
          'route': Routes.USER,
          'text': 'User',
          'icon': Icons.person,
          'selectedIcon': Icons.person,
          'badge': false,
          'badgeText': null,
        }
      ];
}
