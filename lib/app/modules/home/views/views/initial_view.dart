import 'package:flutter/material.dart';

import '../../../../themes/styles/typography.dart';
import '../components/video.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 480;

    PageController pageController = PageController();
    return Center(
      child: Container(
        margin: EdgeInsets.all(isMobile ? 0 : 16),
        width: double.infinity,
        height: double.infinity,
        constraints: BoxConstraints(maxWidth: 480),
        // decoration: BoxDecoration(
        //   image: const DecorationImage(
        //     image: AssetImage('assets/images/mockup.png'),
        //     fit: BoxFit.cover,
        //   ),
        //   borderRadius: BorderRadius.circular(isMobile ? 0 : 16),
        // ),
        child: VideoApp(),
      ),
    );
  }
}
