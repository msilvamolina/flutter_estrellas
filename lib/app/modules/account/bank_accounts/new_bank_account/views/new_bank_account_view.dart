import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/appbar/estrellas_appbar.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../components/buttons/buttons.dart';
import '../../../../../components/dropdown/dropdown.dart';
import '../../../../../components/inputs/phone_input.dart';
import '../../../../../components/inputs/radio_button_input.dart';
import '../../../../../components/inputs/text_input.dart';
import '../../../../../themes/styles/colors.dart';
import '../../../../../themes/styles/typography.dart';
import '../controllers/new_bank_account_controller.dart';

class NewBankAccountView extends GetView<NewBankAccountController> {
  const NewBankAccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewBankAccountController>(
        id: 'view',
        builder: (_) {
          return ReactiveFormBuilder(
            form: controller.buildForm,
            builder: (context, form, child) {
              return Scaffold(
                bottomNavigationBar: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ReactiveFormConsumer(
                      builder: (context, form, child) => Button(
                        label: 'Continuar',
                        style: ButtonStyles.primary,
                        onPressed: (form.valid)
                            ? () => controller.sendForm(form.value)
                            : null,
                      ),
                    ),
                  ),
                ),
                appBar: EstrellasAppbar(title: 'Agregar cuenta bancaria'),
                body: SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => DropDown(
                              label: 'Selecciona el banco',
                              error: controller.bankError.value,
                              selectedValue: controller.bankSelected.value,
                              values: controller.banks
                                  .map(
                                    (String value) => OptionDropDown(
                                      text: value,
                                      value: value,
                                    ),
                                  )
                                  .toList(),
                              onChanged: controller.onBankSelected,
                            ),
                          ),
                          const SizedBox(height: 32),
                          CustomTextInput(
                            autofocus: false,
                            formControlName: Fields.accountNumber.name,
                            keyboardType: TextInputType.text,
                            label: 'Número de cuenta',
                            hintText: 'Ingresa el número',
                          ),
                          const SizedBox(height: 22),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: RadioButtonInput(
                                  formControlName: Fields.accountType.name,
                                  value: 'savings',
                                  text: 'Ahorros',
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: RadioButtonInput(
                                  formControlName: Fields.accountType.name,
                                  value: 'current',
                                  text: 'Corriente',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          CustomTextInput(
                            autofocus: false,
                            formControlName: Fields.fullname.name,
                            keyboardType: TextInputType.text,
                            label: 'Nombre del titular',
                            hintText: 'Ingresa el nombre',
                          ),
                          const SizedBox(height: 18),
                          Obx(
                            () => DropDown(
                              label: 'Tipo de documento',
                              error: controller.documentTypeError.value,
                              selectedValue:
                                  controller.documentTypeSelected.value,
                              values: controller.documentType
                                  .map(
                                    (String value) => OptionDropDown(
                                      text: value,
                                      value: value,
                                    ),
                                  )
                                  .toList(),
                              onChanged: controller.onDocumentTypeSelected,
                            ),
                          ),
                          const SizedBox(height: 32),
                          CustomTextInput(
                            autofocus: false,
                            formControlName: Fields.document.name,
                            keyboardType: TextInputType.text,
                            label: 'Número de documento',
                            hintText: 'Ingresa el número',
                          ),
                          const SizedBox(height: 22),
                          const SizedBox(height: 26),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
