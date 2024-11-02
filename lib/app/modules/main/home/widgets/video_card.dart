import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/data/models/video_model.dart';
import 'package:flutter_estrellas/app/modules/main/home/widgets/video.dart';
import 'package:flutter_estrellas/app/modules/main/home/widgets/video_label.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import '../../../../data/models/videos/video_post_model.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    required this.videoPostModel,
    required this.onCompleted,
    this.bottomSpace = true,
    super.key,
  });

  final VideoPostModel videoPostModel;
  final Function() onCompleted;
  final bool bottomSpace;

  @override
  Widget build(BuildContext context) {
    return VideoApp(
      bottomSpace: bottomSpace,
      videoPostModel: videoPostModel,
      onCompleted: onCompleted,
    );
  }
}
