import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_estrellas/app/ui/components/sidebar_left.dart';
import 'package:flutter_estrellas/app/ui/panels/more_options_panel.dart';
import 'package:flutter_estrellas/app/ui/panels/notifications_panel.dart';
import 'package:flutter_estrellas/app/ui/panels/search_panel.dart';
import 'package:get/get.dart';

import '../../controllers/main_controller.dart';
import '../../data/navigation_data.dart';
import '../components/sidebar_right.dart';
import '../components/navigation/tabbar.dart';
import '../panels/chat_panel.dart';
import '../panels/user_panel.dart';

class BaseLayout extends GetView<MainController> {
  const BaseLayout({
    required this.flexLeftSidebar,
    required this.flexCenter,
    required this.showRightSidebar,
    required this.flexAppbarCenter,
    this.hideAppbarSpaces = false,
    super.key,
    this.view,
  });
  final Widget? view;
  final int flexLeftSidebar;
  final int flexCenter;
  final bool showRightSidebar;
  final int flexAppbarCenter;
  final bool hideAppbarSpaces;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.closeAllPanels,
      child: Stack(
        children: [
          DefaultTabController(
            initialIndex: controller.indexSelected,
            length: controller.data.length,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Container(
                  color: Colors.grey[900],
                  child: Tabbar(
                    flexLeft: flexLeftSidebar,
                    flexCenter: flexCenter,
                    flexRight: showRightSidebar ? flexLeftSidebar : 0,
                    hideRight: !showRightSidebar,
                    hideAppbarSpaces: hideAppbarSpaces,
                    flexAppbarCenter: flexAppbarCenter,
                  ),
                ),
              ),
              body: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: flexLeftSidebar,
                    child: SidebarLeft(
                      isTiny: !showRightSidebar,
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: flexCenter,
                    child: view ??
                        TabBarView(
                          children: NavigationData.getViews(),
                        ),
                  ),
                  if (showRightSidebar) ...[
                    Spacer(),
                    Expanded(
                      flex: flexLeftSidebar,
                      child: SidebarRight(),
                    ),
                  ],
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: kToolbarHeight,
            child: SearchPanel(),
          ),
          Positioned(
            right: 16,
            top: kToolbarHeight,
            child: NotificationsPanel(),
          ),
          Positioned(
            right: 16,
            top: kToolbarHeight,
            child: ChatPanel(),
          ),
          Positioned(
            right: 16,
            top: kToolbarHeight,
            child: UserPanel(),
          ),
          Positioned(
            right: 16,
            top: kToolbarHeight,
            child: MoreOptionsPanel(),
          ),
        ],
      ),
    );
  }
}
