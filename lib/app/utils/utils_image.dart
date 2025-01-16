import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../themes/styles/colors.dart';

class UtilsImage {
  UtilsImage._();

  static Future<String?> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      CroppedFile? croppedFile = await cropImage(image.path);
      if (croppedFile != null) {
        return croppedFile.path;
      }
    }
    return null;
  }

  static Future<CroppedFile?> cropImage(String imagePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      compressQuality: 70,
      sourcePath: imagePath,
      aspectRatio: const CropAspectRatio(ratioX: 400, ratioY: 400),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Recortar',
          toolbarColor: white,
          toolbarWidgetColor: neutral900,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        IOSUiSettings(
          rectWidth: 400,
          rectHeight: 400,
          title: 'Recortar',
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        WebUiSettings(
          context: Get.context!,
        ),
      ],
    );

    return croppedFile;
  }
}
