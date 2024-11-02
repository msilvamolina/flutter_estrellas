import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
        shadowColor: Colors.transparent,
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
