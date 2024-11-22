import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../libraries/icons/icons_font.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../../../main/home/controllers/home_controller.dart';
import '../../../main/home/widgets/video_card.dart';
import '../controllers/video_list_controller.dart';

class VideoListView extends GetView<VideoListController> {
  const VideoListView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 480;

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: white,
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () => Get.toNamed(Routes.CART),
                icon: Icon(
                  EstrellasIcons.shoppingCartSimpleFill,
                  color: white,
                  size: 40,
                ),
              ),
              GetX<HomeController>(
                builder: (controller) {
                  if (controller
                      .userProductController.listProductCart.isNotEmpty) {
                    return Positioned(
                      right: 6,
                      top: 8,
                      child: CircleAvatar(
                        radius: 9,
                        backgroundColor: error900,
                        child: Text(
                          controller
                              .userProductController.listProductCart.length
                              .toString(),
                          style: TypographyStyle.bodyBlackSmall
                              .copyWith(color: white, fontSize: 12),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(isMobile ? 0 : 16),
        width: double.infinity,
        height: double.infinity,
        child: controller.listVideos.isNotEmpty
            ? PageView.builder(
                itemCount: controller.list.length,
                controller: controller.pageController,
                scrollDirection: Axis.vertical,
                onPageChanged: controller.setValue,
                itemBuilder: (context, index) => VideoCard(
                  bottomSpace: false,
                  videoPostModel: controller.listVideos[index],
                  onCompleted: () {
                    controller.pageController.animateToPage(
                      controller.pageSelected.value++,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.linear,
                    );
                  },
                ),
              )
            : Center(
                child: Text('no data'),
              ),
      ),
    );
  }
}
