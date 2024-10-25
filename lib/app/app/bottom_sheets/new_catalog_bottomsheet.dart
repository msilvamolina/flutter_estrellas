import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../themes/input_decoration.dart';
import '../../themes/styles/colors.dart';
import '../../themes/styles/typography.dart';

class NewCatalogBottomsheet extends StatelessWidget {
  const NewCatalogBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    return GetBuilder<UserProductController>(
      id: 'new_catalog_bottom_sheet',
      builder: (controller) {
        ProductFirebaseLiteModel product =
            controller.productCatalogBottomSheet!;
        return Material(
          child: SafeArea(
            top: false,
            child: ReactiveFormBuilder(
              form: controller.addCatalogForm,
              builder: (context, form, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ReactiveTextField(
                      formControlName: Fields.addCatalog.name,
                      keyboardType: TextInputType.emailAddress,
                      decoration: CustomInputDecoration.inputDecoration(
                        isThemeModeDark: mainController.isThemeModeDark,
                        text: "Nombre de nuevo catalogo",
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
