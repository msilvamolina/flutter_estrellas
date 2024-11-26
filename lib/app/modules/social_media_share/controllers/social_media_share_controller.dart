import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:social_sharing_plus/social_sharing_plus.dart';

import '../../../data/models/videos/video_post_model.dart';

class SocialMediaShareController extends GetxController {
  late VideoPostModel videoPostModel;

  List<SocialPlatform> _platforms = SocialPlatform.values;
  List<SocialPlatform> get platforms => _platforms;

  bool _isLoading = true;
  bool get isloading => _isLoading;

  String? imagePath;
  String? shareTitle;
  @override
  Future<void> onInit() async {
    videoPostModel = Get.arguments as VideoPostModel;
    final String link = 'http://checkout.estrellas.pro/GH56SS';
    final String name = videoPostModel.name;
    final String title = '¡Compra ';
    final String title2 = ' en Estrellas! ';
    shareTitle = title + name + title2 + link;

    String imageUrl = videoPostModel.product!.thumbnail!;
    imagePath = await downloadImage(imageUrl);
    _isLoading = false;
    update(['view']);
    super.onInit();
  }

  Future<String?> downloadImage(String imageUrl) async {
    try {
      // Obtén el directorio temporal del dispositivo
      final tempDir = await getTemporaryDirectory();
      final fileName = imageUrl.split('/').last;
      final path = '${tempDir.path}/$fileName';

      // Verifica si el archivo ya existe
      if (await File(path).exists()) {
        return path;
      }

      // Descarga la imagen y guárdala en el directorio temporal
      await Dio().download(imageUrl, path);

      // Verifica si el archivo se descargó correctamente
      if (await File(path).exists()) {
        return path;
      } else {
        print('La imagen no se descargó correctamente.');
        return null;
      }
    } catch (e) {
      print('Error al descargar la imagen: $e');
      return null;
    }
  }

  Future<void> share(SocialPlatform platform) async {
    await SocialSharingPlus.shareToSocialMedia(
      platform,
      shareTitle ?? '',
      media: imagePath,
      isOpenBrowser: true,
      onAppNotInstalled: () {
        ScaffoldMessenger.of(Get.context!)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text('${platform.name.capitalize} is not installed.'),
          ));
      },
    );
  }
}
