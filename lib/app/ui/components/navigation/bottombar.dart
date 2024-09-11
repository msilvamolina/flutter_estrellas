import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main_controller.dart';
import '../../../data/navigation_data.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map> data = NavigationData.getData();
    return GetBuilder<MainController>(
      builder: (_controller) {
        return NavigationBar(
          onDestinationSelected:
              kIsWeb ? _controller.goToPage : _controller.changeIndex,
          indicatorColor: Colors.amber,
          selectedIndex: _controller.indexSelected,
          destinations: <Widget>[
            for (Map item in data)
              NavigationDestination(
                selectedIcon: Icon(item['selectedIcon']),
                icon: Icon(item['icon']),
                label: item['text'],
              ),
          ],
        );
      },
    );
  }
}
