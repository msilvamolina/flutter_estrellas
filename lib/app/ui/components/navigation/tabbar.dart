import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/ui/components/appbar_right.dart';
import 'package:get/get.dart';

import '../../../controllers/main_controller.dart';
import '../appbar_left.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({
    super.key,
    required this.flexLeft,
    required this.flexCenter,
    required this.flexAppbarCenter,
    required this.flexRight,
    this.hideRight = false,
    this.hideAppbarSpaces = false,
  });

  final int flexLeft;
  final int flexCenter;
  final int flexAppbarCenter;
  final int flexRight;
  final bool hideRight;
  final bool hideAppbarSpaces;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_controller) {
        return Row(
          children: [
            Expanded(
              flex: flexLeft,
              child: AppbarLeft(),
            ),
            if (!hideAppbarSpaces) Spacer() else SizedBox(width: 16),
            Expanded(
              flex: flexAppbarCenter,
              child: !kIsWeb
                  ? TabBar(
                      onTap: _controller.changeIndex,
                      tabs: [
                        for (Map item in _controller.data)
                          Tab(
                            icon: Icon(item['icon']),
                          ),
                      ],
                    )
                  : Row(
                      children: [
                        for (Map item in _controller.data)
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _controller.goToPage(item['index']);
                              },
                              child: Container(
                                height: kToolbarHeight,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      item['icon'],
                                      color: _controller.indexSelected ==
                                              item['index']
                                          ? Colors.purple[100]
                                          : Colors.white,
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      height: 2,
                                      width: 20,
                                      color: _controller.indexSelected ==
                                              item['index']
                                          ? Colors.purple[100]
                                          : Colors.transparent,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
            ),
            if (!hideRight) ...[
              if (!hideAppbarSpaces) Spacer(),
              Expanded(
                flex: flexRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: AppbarRight(),
                ),
              ),
            ]
          ],
        );
      },
    );
  }
}
