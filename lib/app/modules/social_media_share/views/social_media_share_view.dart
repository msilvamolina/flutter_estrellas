import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/social_media_share_controller.dart';

class SocialMediaShareView extends GetView<SocialMediaShareController> {
  const SocialMediaShareView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SocialMediaShareView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SocialMediaShareView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
