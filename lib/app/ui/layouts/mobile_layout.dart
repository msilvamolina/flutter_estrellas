import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_estrellas/app/ui/components/drawer.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import '../components/navigation/bottombar.dart';
import '../../data/navigation_data.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({
    super.key,
    this.view,
  });
  final Widget? view;

  @override
  Widget build(BuildContext context) {
    FocusNode searchFocusNode = FocusNode();

    return GetBuilder<MainController>(
      id: 'navigation',
      builder: (_controller) {
        return Scaffold(
          appBar: AppBar(
            title: _controller.viewSearch.value
                ? TextField(
                    focusNode: searchFocusNode,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          gapPadding: 16,
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  )
                : Text('Facebook Like'),
            leading: _controller.viewSearch.value
                ? IconButton(
                    onPressed: _controller.closeAllPanels,
                    icon: Icon(Icons.arrow_back),
                  )
                : null,
            actions: [
              IconButton(
                onPressed: () {
                  _controller.openSearchMobile();
                  Future.delayed(Duration(milliseconds: 100), () {
                    if (_controller.viewSearch.value) {
                      FocusScope.of(context).requestFocus(searchFocusNode);
                    } else {
                      FocusScope.of(context).unfocus();
                    }
                  });
                },
                icon: Icon(Icons.search),
              ),
              if (!_controller.viewSearch.value) ...[
                IconButton(
                  onPressed: _controller.openNotificationsMobile,
                  icon: Icon(Icons.notifications),
                ),
                IconButton(
                  onPressed: _controller.openMoreOptions,
                  icon: Icon(Icons.more_vert),
                ),
              ]
            ],
          ),
          drawer: DrawerWidget(),
          bottomNavigationBar: Bottombar(),
          body: _controller.viewSearch.value
              ? Container(child: Text('Search ListView'))
              : view ?? NavigationData.getViews()[_controller.indexSelected],
        );
      },
    );
  }
}
