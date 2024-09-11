import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/modules/home/notifications/controllers/notifications_controller.dart';
import 'package:get/get.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      id: 'view',
      init: NotificationsController(),
      builder: (_controller) {
        if (_controller.isLoading)
          return Center(child: CircularProgressIndicator());
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
