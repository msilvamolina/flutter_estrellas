import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';

import 'package:get/get.dart';

import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/notifications_list_controller.dart';
import '../widgets/notifications_empty_state.dart';

class NotificationsListView extends GetView<NotificationsListController> {
  const NotificationsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: EstrellasAppbar(title: 'Notificaciones'),
        body: Column(
          children: [
            PreferredSize(
              preferredSize: TabBar(
                tabs: <Widget>[],
              ).preferredSize,
              child: Container(
                color: white,
                child: TabBar(
                  labelStyle: TypographyStyle.bodyBlackLarge,
                  indicatorColor: primaryBase,
                  labelColor: secondaryBase,
                  tabs: [
                    Tab(text: "Todas"),
                    Tab(text: "Leídas"),
                    Tab(text: "Sin leer"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(26),
                child: TabBarView(
                  children: [
                    NotificationsEmptyState(),
                    NotificationsEmptyState(),
                    NotificationsEmptyState(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
