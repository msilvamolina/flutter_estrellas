import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/ui/amzwidgets/amz_icon_button.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controllers/main_controller.dart';

class AppbarLeft extends GetView<MainController> {
  const AppbarLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      child: Row(
        children: [
          Obx(
            () => AnimatedCrossFade(
              firstChild: Padding(
                padding: const EdgeInsets.only(left: 24, right: 8),
                child: AmzIconButton(
                  backgroundColor: Colors.deepOrange,
                  onPressed: controller.goHome,
                  icon: Icons.home,
                  tooltip: 'Home',
                ),
              ),
              secondChild: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: AmzIconButton(
                  backgroundColor: Colors.transparent,
                  onPressed: controller.closeAllPanels,
                  icon: Icons.arrow_back,
                  tooltip: 'Atrás',
                ),
              ),
              crossFadeState: controller.viewSearch.value
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 300),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: VxCapsule(
                    backgroundColor: Colors.grey[800],
                  ),
                ),
                TextField(
                  onChanged: controller.onSearchChanged,
                  focusNode: controller.searchMobileFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    suffixIcon: IconButton(
                      onPressed: controller.onSearchPressed,
                      icon: Icon(Icons.search),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
