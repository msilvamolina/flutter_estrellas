import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controllers/main_controller.dart';

class SidebarLeft extends StatelessWidget {
  const SidebarLeft({super.key, this.isTiny = false});

  final bool isTiny;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_controller) {
        return Container(
          padding: EdgeInsets.all(16),
          child: VStack(
            [
              for (Map item in _controller.leftOptions) _optionCard(item),
              Obx(
                () => Column(
                  children: [
                    _controller.viewMore.value
                        ? Column(children: [
                            for (Map item in _controller.leftOptions2)
                              _optionCard(item)
                          ])
                        : SizedBox(),
                    _optionCard({
                      'icon': _controller.viewMore.value
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      'text': 'Ver más',
                      'onTap': () {
                        _controller.viewMore.value =
                            !_controller.viewMore.value;
                      }
                    }),
                  ],
                ),
              ),
            ],
          ).scrollVertical(),
        );
      },
    );
  }

  Widget _optionCard(Map<dynamic, dynamic> item) {
    return InkWell(
      onTap: item['onTap'],
      child: Row(
        children: [
          CircleAvatar(
            child: Icon(item['icon']),
          ),
          16.widthBox,
          Expanded(
            child: item['text'].toString().text.size(16).make(),
          ),
        ],
      ).box.p8.make(),
    );
  }
}
