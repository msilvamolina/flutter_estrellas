import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/data/models/video_model.dart';
import 'package:flutter_estrellas/app/modules/main/home/widgets/video.dart';
import 'package:flutter_estrellas/app/modules/main/home/widgets/video_label.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../data/models/videos/video_post_model.dart';
import '../../../../themes/styles/colors.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    required this.videoPostModel,
    // required this.onCompleted,
    this.bottomSpace = true,
    super.key,
  });

  final VideoPostModel videoPostModel;
  // final Function() onCompleted;
  final bool bottomSpace;

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    return Stack(
      children: [
        VideoApp(
          bottomSpace: bottomSpace,
          videoPostModel: videoPostModel,
          // onCompleted: onCompleted,
        ),
        if (mainController.showSwipeUpVideo)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/lotties/Swipe-up.json',
                ),
                Text(
                  'Deliza hacia arriba para ver\nmás productos',
                  textAlign: TextAlign.center,
                  style: TypographyStyle.bodyBlackMedium.copyWith(
                    color: neutral50,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1), // Desplazamiento en x y y
                        blurRadius: 8, // Radio de desenfoque
                        color:
                            Colors.black.withOpacity(0.5), // Color de la sombra
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
