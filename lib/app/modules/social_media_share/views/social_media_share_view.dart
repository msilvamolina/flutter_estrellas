import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import 'package:get/get.dart';
import 'package:social_sharing_plus/social_sharing_plus.dart';

import '../controllers/social_media_share_controller.dart';

class SocialMediaShareView extends GetView<SocialMediaShareController> {
  const SocialMediaShareView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compartir'),
      ),
      body: GetBuilder<SocialMediaShareController>(
        id: 'view',
        builder: (_) {
          return !controller.isloading
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          controller.shareTitle ?? '',
                          textAlign: TextAlign.center,
                          style: TypographyStyle.bodyBlackLarge,
                        ),
                        SizedBox(height: 16),
                        Image.asset(
                          controller.imagePath ?? '',
                          width: 200,
                        ),
                        SizedBox(height: 16),
                        ...controller.platforms.map(
                          (SocialPlatform platform) => ElevatedButton(
                            onPressed: () => controller.share(platform),
                            child: Text('Share to ${platform.name.capitalize}'),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
