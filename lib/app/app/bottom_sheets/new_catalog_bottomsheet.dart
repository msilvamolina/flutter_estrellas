import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:flutter_estrellas/app/data/models/product_firebase_lite/product_firebase_lite.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../components/buttons/buttons.dart';
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
            child: Padding(
              padding: const EdgeInsets.all(26),
              child: ReactiveFormBuilder(
                form: controller.addCatalogForm,
                builder: (context, form, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Crear catálogo',
                        style: TypographyStyle.bodyBlackLarge,
                      ),
                      SizedBox(height: 20),
                      ReactiveTextField(
                        cursorColor: secondaryBase,
                        formControlName: Fields.addCatalogName.name,
                        keyboardType: TextInputType.text,
                        decoration: CustomInputDecoration.inputDecoration(
                          isThemeModeDark: mainController.isThemeModeDark,
                          text: "Nombre de nuevo catálogo",
                        ),
                      ),
                      SizedBox(height: 16),
                      ReactiveFormConsumer(
                        builder: (context, form, child) => LoadingButton(
                          isLoading: controller.addCatalogIsLoading,
                          style: ButtonStyles.primary,
                          onPressed: (form.valid)
                              ? () => controller.sendFormAddCatalog(form.value)
                              : null,
                          label: 'Guardar',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
