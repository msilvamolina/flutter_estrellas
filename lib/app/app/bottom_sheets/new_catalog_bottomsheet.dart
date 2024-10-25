import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/app/controllers/user_product_controller.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../components/buttons/buttons.dart';
import '../../components/inputs/text_input.dart';

import '../../themes/styles/typography.dart';
import 'widgets/content_bottomsheet.dart';
import 'widgets/title_with_close_button.dart';

class NewCatalogBottomsheet extends StatelessWidget {
  const NewCatalogBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProductController>(
      id: 'new_catalog_bottom_sheet',
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: ReactiveFormBuilder(
            form: controller.addCatalogForm,
            builder: (context, form, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TitleWithCloseButton(title: 'Crear catálogo'),
                  ContentBottomsheet(
                    children: [
                      CustomTextInput(
                        autofocus: true,
                        formControlName: Fields.addCatalogName.name,
                        keyboardType: TextInputType.text,
                        label: "Nombre de nuevo catálogo",
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
                      SizedBox(height: 16),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
