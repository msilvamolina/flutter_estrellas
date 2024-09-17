import 'package:flutter/material.dart';

import '../../../../data/models/video_model.dart';
import '../../../../themes/styles/typography.dart';
import '../components/video.dart';
import '../components/video_card.dart';

class InitialView extends StatefulWidget {
  const InitialView({super.key});

  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 480;

    List<VideoModel> videoList = [
      VideoModel(
        id: 'video1',
        videoUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo1%2Fvideo1.mp4?alt=media&token=7d08112c-7f9b-49cd-900f-c75b38120cf6',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo1%2Fvideo1.jpg?alt=media&token=a68531c4-31ad-4054-a0f7-b29b0dfaf14d',
      ),
      VideoModel(
        id: 'video2',
        videoUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo2%2Fvideo2.mp4?alt=media&token=bddfc9fa-84e1-464f-a1df-fae96cfdaacf',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo2%2Fvideo2.jpg?alt=media&token=c586758e-1c72-4ccb-88bf-405b025c3b01',
      ),
      VideoModel(
        id: 'video3',
        videoUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo3%2Fvideo3.mp4?alt=media&token=d22dffa1-7ad2-4cf8-91c8-bcb8d7bc8247',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo3%2Fvideo3.jpg?alt=media&token=a0aa3c01-9bc6-4476-a5e8-993111615a5f',
      ),
      VideoModel(
        id: 'video4',
        videoUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo4%2Fvideo4.mp4?alt=media&token=f7cfe4f8-71f7-4a42-9bb6-5449893539c0',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo4%2Fvideo4.jpg?alt=media&token=6bc606fb-741c-4ce0-986c-9cedc99b0890',
      ),
      VideoModel(
        id: 'video5',
        videoUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo5%2Fvideo5.mp4?alt=media&token=70a18d2d-fead-4554-a8b1-ca32e6f5beac',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo5%2Fvideo5.jpg?alt=media&token=1ceca406-e7e4-41fb-9b66-78f6d1a62c8d',
      ),
      VideoModel(
        id: 'video6',
        videoUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo6%2Fvideo6.mp4?alt=media&token=838dec47-4aed-4b17-97b3-225dbf96b18d',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo6%2Fvideo6.jpg?alt=media&token=44b3e6e2-a71c-4d4f-84d1-d53ade78622c',
      ),
      VideoModel(
        id: 'video7',
        videoUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo7%2Fvideo7.mp4?alt=media&token=938da206-8d23-407d-ae7f-4cdb389e4671',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo7%2Fvideo7.jpg?alt=media&token=9553734e-1d5e-4eea-a813-f8ef8af612d7',
      ),
      VideoModel(
        id: 'video8',
        videoUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo8%2Fvideo8.mp4?alt=media&token=2221054e-501f-4abd-842b-d728f82659d6',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo8%2Fvideo8.jpg?alt=media&token=fa5bb7e1-f3af-476a-ae7a-c7a87c422c1b',
      ),
      VideoModel(
        id: 'video9',
        videoUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo9%2Fvideo9.mp4?alt=media&token=ccd4616f-edb3-4220-aba5-edde911d7e1e',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo9%2Fvideo9.jpg?alt=media&token=8a77f0ea-ac92-4955-9a75-1099dcf83c81',
      ),
      VideoModel(
        id: 'video10',
        videoUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo10%2Fvideo10.mp4?alt=media&token=440094dc-db68-45e4-971d-016d5877b9b4',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo10%2Fvideo10.jpg?alt=media&token=8a37bc8f-8e89-4fc9-862d-a2f5012dd952',
      ),
      VideoModel(
        id: 'video11',
        videoUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo11%2Fvideo11.mp4?alt=media&token=54ca6c75-60df-46c7-9e84-35e33b095203',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/estrellas-dev-4fea3.appspot.com/o/videos%2Fvideo11%2Fvideo11.jpg?alt=media&token=94620209-bab3-4ae7-a130-e0965f978a28',
      ),
    ];

    PageController pageController = PageController();

    int pageSelected = 0;
    return SafeArea(
      child: Center(
        child: Container(
          margin: EdgeInsets.all(isMobile ? 0 : 16),
          width: double.infinity,
          height: double.infinity,
          child: PageView.builder(
            itemCount: videoList.length,
            controller:
                PageController(initialPage: pageSelected, viewportFraction: 1),
            scrollDirection: Axis.vertical,
            onPageChanged: (value) {
              setState(() {
                pageSelected = value;
              });
            },
            itemBuilder: (context, index) => VideoCard(
                videoModel: videoList[index],
                onCompleted: () {
                  pageController.animateToPage(pageSelected++,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.linear);
                  // pageController.
                }),
          ),
        ),
      ),
    );
  }
}
