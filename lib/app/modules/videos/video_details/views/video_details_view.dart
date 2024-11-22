import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../libraries/icons/icons_font.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../../../main/home/controllers/home_controller.dart';
import '../../../main/home/widgets/video_card.dart';
import '../controllers/video_details_controller.dart';

class VideoDetailsView extends GetView<VideoDetailsController> {
  const VideoDetailsView({super.key});
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
      body: VideoCard(
        bottomSpace: false,
        videoPostModel: controller.videoPostModel,
        onCompleted: () {},
      ),
    );
  }
}
