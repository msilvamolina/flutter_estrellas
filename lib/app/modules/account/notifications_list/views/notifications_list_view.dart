import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';

import 'package:get/get.dart';

import '../controllers/notifications_list_controller.dart';
import '../widgets/notifications_empty_state.dart';

class NotificationsListView extends GetView<NotificationsListController> {
  const NotificationsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstrellasAppbar(title: 'Notificaciones'),
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: NotificationsEmptyState(),
      ),
    );
  }
}
