import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_estrellas/app/modules/auth/email_verification/controllers/email_verification_controller.dart';
import 'package:flutter_estrellas/app/modules/main/account/controllers/account_controller.dart';
import 'package:flutter_estrellas/app/modules/main/home/controllers/home_controller.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'widgets/title_with_close_button.dart';

class ShareBottomsheet extends StatelessWidget {
  const ShareBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProductController>(
      id: 'share_bottomsheet',
      builder: (controller) {
        return Container(
          width: double.infinity,
          child: !controller.shareIsLoading
              ? Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            controller.shareTitle,
                            style: TypographyStyle.h3Mobile,
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: controller.shareCopyLink,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 26,
                                      backgroundColor: neutral200,
                                      child: Icon(
                                        EstrellasIcons.link,
                                        size: 28,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Copiar',
                                      style: TypographyStyle.bodyRegularMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: controller.shareDownload,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 26,
                                      backgroundColor: neutral200,
                                      child: Icon(
                                        EstrellasIcons.downloadSimple,
                                        size: 24,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Descargar',
                                      style: TypographyStyle.bodyRegularMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: controller.shareWhatsapp,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 26,
                                      backgroundColor: neutral200,
                                      child: Image.asset(
                                          'assets/images/whatsapp-icon.png'),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'WhatsApp',
                                      style: TypographyStyle.bodyRegularMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: controller.shareFacebook,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 26,
                                      backgroundColor: neutral200,
                                      child: Image.asset(
                                          'assets/images/facebook-icon.png'),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Facebook',
                                      style: TypographyStyle.bodyRegularMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: controller.shareInstagram,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 26,
                                      backgroundColor: neutral200,
                                      child: Image.asset(
                                          'assets/images/instagram-icon.png'),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Instagram',
                                      style: TypographyStyle.bodyRegularMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    TitleWithCloseButton(title: ''),
                  ],
                )
              : SizedBox(
                  height: 180,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        );
      },
    );
  }
}
