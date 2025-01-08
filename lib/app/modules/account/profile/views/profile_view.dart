import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';
import 'package:flutter_estrellas/app/themes/styles/colors.dart';
import 'package:flutter_estrellas/app/themes/styles/typography.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../components/buttons/buttons.dart';
import '../../../../components/inputs/phone_input.dart';
import '../../../../components/inputs/text_input.dart';
import '../controllers/profile_controller.dart';
import '../widgets/photo_card_empty.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool value, _) => controller.onUserBack(),
      child: ReactiveFormBuilder(
        form: controller.buildForm,
        builder: (context, form, child) {
          return Scaffold(
            appBar: EstrellasAppbar(title: 'Editar perfil'),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ReactiveFormConsumer(
                  builder: (context, form, child) => Button(
                    label: 'Guardar',
                    style: ButtonStyles.primary,
                    onPressed: (form.valid)
                        ? () => controller.sendForm(form.value)
                        : null,
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 94),
                width: double.infinity,
                child: Column(
                  children: [
                    GetBuilder<ProfileController>(
                      id: 'photo_card',
                      builder: (_) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: controller.pickImage,
                              child: PhotoCardEmpty(
                                isFull: controller.isFullUser,
                                imageUrl: controller.imagePath,
                                networkUrl: controller.imageNetwork,
                              ),
                            ),
                            SizedBox(height: 8),
                            Obx(
                              () => Text(
                                controller.userTitle.value ?? '',
                                style: TypographyStyle.bodyBlackLarge,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              controller.isFullUser
                                  ? 'Estrella plus'
                                  : '50% completado',
                              style: TypographyStyle.bodyRegularMedium
                                  .copyWith(color: secondaryBase),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 46),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          CustomTextInput(
                            autofocus: false,
                            formControlName: Fields.fullname.name,
                            keyboardType: TextInputType.text,
                            label: 'Nombre completo',
                            hintText: 'Como está en tu documento',
                          ),
                          const SizedBox(height: 32),
                          CustomTextInput(
                            autofocus: false,
                            formControlName: Fields.document.name,
                            keyboardType: TextInputType.number,
                            label: 'Número de documento',
                            hintText: 'Ingresa tu documento',
                          ),
                          const SizedBox(height: 32),
                          CustomTextInput(
                            autofocus: false,
                            readOnly: true,
                            formControlName: Fields.email.name,
                            keyboardType: TextInputType.text,
                            label: 'Correo',
                            hintText: 'Ingresa tu correo',
                          ),
                          const SizedBox(height: 32),
                          CustomPhoneInput(
                            autofocus: false,
                            formControlName: Fields.phone.name,
                            keyboardType: TextInputType.phone,
                            label: 'Celular',
                            hintText: 'Ingresa el número de celular',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
