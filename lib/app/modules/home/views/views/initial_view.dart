import 'package:flutter/material.dart';

import '../../../../themes/styles/typography.dart';
import '../components/video.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 480;

    List<String> videoList = [
      'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fharry.mp4?alt=media&token=e1b3d447-232b-4080-a679-e4497a19b1fc',
      'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fharry.mp4?alt=media&token=e1b3d447-232b-4080-a679-e4497a19b1fc',
      'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fharry.mp4?alt=media&token=e1b3d447-232b-4080-a679-e4497a19b1fc',
    ];

    PageController pageController = PageController();
    return Center(
      child: Container(
        margin: EdgeInsets.all(isMobile ? 0 : 16),
        width: double.infinity,
        height: double.infinity,
        constraints: BoxConstraints(maxWidth: 480),
        child: PageView.builder(
          itemCount: videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => VideoApp(videoUrl: videoList[index]),
        ),
      ),
    );
  }
}
