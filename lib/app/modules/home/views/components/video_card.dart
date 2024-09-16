import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/video_model.dart';
import 'package:flutter_estrellas/app/modules/home/views/components/video.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    required this.videoModel,
    required this.onCompleted,
    super.key,
  });

  final VideoModel videoModel;
  final Function() onCompleted;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 480;

    return Center(
      child: Stack(
        children: [
          VideoApp(
            videoModel: videoModel,
            onCompleted: onCompleted,
          ),
          Center(
            child: AspectRatio(
              aspectRatio: 9 / 16,
              child: Column(
                children: [
                  Spacer(),
                  IconButton.filled(
                      onPressed: () {},
                      icon: Icon(Icons.access_alarm_outlined)),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/avatar.png',
                        width: 36,
                      ),
                      Text(
                        'Bolso femenino cuero y tiras metálicas',
                        style: TypographyStyle.bodyRegularMedium,
                      ),
                    ],
                  ),
                  if (isMobile)
                    SizedBox(
                      height: 80,
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
