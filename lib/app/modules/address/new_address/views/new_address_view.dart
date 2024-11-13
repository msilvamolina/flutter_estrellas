import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/buttons/buttons.dart';
import 'package:flutter_estrellas/app/data/models/city/city/city_model.dart';
import 'package:flutter_estrellas/app/data/models/city/department/department_model.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../components/dropdown/dropdown.dart';
import '../../../../themes/input_decoration.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/new_address_controller.dart';
import '../../../../components/step_indicator/step_indicator.dart';

class NewAddressView extends GetView<NewAddressController> {
  const NewAddressView({super.key});
  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
        form: controller.buildForm,
        builder: (context, form, child) {
          return Scaffold(
            backgroundColor: white,
            appBar: AppBar(
              backgroundColor: white,
              surfaceTintColor: white,
              title: Text(
                'Domicilio',
                style: TypographyStyle.bodyBlackLarge2,
              ),
              centerTitle: true,
            ),
            body: GetBuilder<NewAddressController>(
              id: 'view',
              builder: (_) {
                return SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StepIndicator(
                            currentStep: 1,
                            totalSteps: 2,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Datos de la persona que recibe',
                            style: TypographyStyle.bodyBlackLarge2,
                          ),
                          const SizedBox(height: 28),
                          ReactiveTextField(
                            formControlName: Fields.name.name,
                            keyboardType: TextInputType.text,
                            decoration: CustomInputDecoration.inputDecoration(
                              text: "Nombre completo",
                              hintText: 'Como está en tu documento',
                            ),
                          ),
                          const SizedBox(height: 22),
                          ReactiveTextField(
                            formControlName: Fields.phone.name,
                            keyboardType: TextInputType.phone,
                            decoration: CustomInputDecoration.inputDecoration(
                              text: "Celular",
                              hintText: 'Ingresa el número de celular',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 8),
                            child: Text(
                                'Te llamaremos si tenemos problemas en el envío'),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Lugar de envío',
                            style: TypographyStyle.bodyBlackLarge2,
                          ),
                          const SizedBox(height: 16),
                          Obx(
                            () => DropDown(
                              error: controller.departmentError,
                              selectedValue:
                                  controller.departmentSelected.value,
                              values: controller.departmentsList
                                  .map(
                                    (DepartmentModel value) => OptionDropDown(
                                      text: value.name,
                                      value: value.dropiId.toString(),
                                    ),
                                  )
                                  .toList(),
                              onChanged: controller.onDepartmentSelected,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Obx(
                            () => controller.cityList.isNotEmpty
                                ? DropDown(
                                    error: controller.cityError,
                                    selectedValue:
                                        controller.citySelected.value,
                                    values: controller.cityList
                                        .map(
                                          (CityModel value) => OptionDropDown(
                                            text: value.name ?? '',
                                            value: value.id.toString(),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: controller.onCitySelected,
                                  )
                                : SizedBox.shrink(),
                          ),
                          const SizedBox(height: 26),
                          ReactiveTextField(
                            formControlName: Fields.address.name,
                            keyboardType: TextInputType.text,
                            decoration: CustomInputDecoration.inputDecoration(
                              text: "Direccion",
                            ),
                          ),
                          const SizedBox(height: 26),
                          ReactiveTextField(
                            formControlName: Fields.notes.name,
                            keyboardType: TextInputType.text,
                            maxLines: 6,
                            decoration: CustomInputDecoration.inputDecoration(
                                text: "Referencias adicionales",
                                hintText:
                                    'Ingresa una descripción de la dirección o indicaciones de entrega'),
                          ),
                          const SizedBox(height: 16),
                          Text(
                              'Al Continuar, aceptas los Términos y condiciones y la Política de privacidad de Estrellas.'),
                          const SizedBox(height: 26),
                          ReactiveFormConsumer(
                            builder: (context, form, child) => Button(
                              label: 'Continuar',
                              style: ButtonStyles.primary,
                              onPressed: (form.valid)
                                  ? () => controller.sendForm(form.value)
                                  : null,
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
        });
  }
}
