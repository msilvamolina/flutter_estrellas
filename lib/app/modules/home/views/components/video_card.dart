import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/video_model.dart';
import 'package:flutter_estrellas/app/modules/home/views/components/video.dart';
import 'package:flutter_estrellas/app/modules/home/views/components/video_label.dart';
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

    return VideoApp(
      videoModel: videoModel,
      onCompleted: onCompleted,
    );
  }
}
