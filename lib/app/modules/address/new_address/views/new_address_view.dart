import 'package:flutter/material.dart';
import 'package:flutter_estrellas/app/components/buttons/buttons.dart';
import 'package:flutter_estrellas/app/data/models/city/city/city_model.dart';
import 'package:flutter_estrellas/app/data/models/city/department/department_model.dart';
import 'package:flutter_estrellas/app/libraries/icons/icons_font.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';

import '../../../../components/dropdown/dropdown.dart';
import '../../../../components/inputs/phone_input.dart';
import '../../../../components/inputs/text_input.dart';
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
                          // Text(
                          //   form.findControl(path).toString(),
                          //   style: TypographyStyle.bodyBlackLarge2,
                          // ),
                          const SizedBox(height: 16),
                          Text(
                            'Datos de la persona que recibe',
                            style: TypographyStyle.bodyBlackLarge2,
                          ),
                          const SizedBox(height: 28),
                          CustomTextInput(
                            autofocus: false,
                            formControlName: Fields.name.name,
                            keyboardType: TextInputType.text,
                            label: 'Nombre completo',
                            hintText: 'Como está en tu documento',
                          ),
                          const SizedBox(height: 22),
                          CustomPhoneInput(
                            autofocus: false,
                            formControlName: Fields.phone.name,
                            keyboardType: TextInputType.phone,
                            label: 'Celular',
                            hintText: 'Ingresa el número de celular',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 8),
                            child: Text(
                              'Te llamaremos si tenemos problemas en el envío',
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Lugar de envío',
                            style: TypographyStyle.bodyBlackLarge2,
                          ),
                          const SizedBox(height: 16),
                          Obx(
                            () => DropDown(
                              label: 'Departamento',
                              error: controller.departmentError.value,
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
                                    label: 'Ciudad o municipio',
                                    error: controller.cityError.value,
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
                          CustomTextInput(
                            autofocus: false,
                            formControlName: Fields.address.name,
                            keyboardType: TextInputType.text,
                            label: 'Dirección',
                            hintText: 'Ingresa la dirección',
                          ),
                          const SizedBox(height: 10),
                          Obx(
                            () => InkWell(
                              onTap: controller.onSaveAddressChanged,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      controller.saveAddress.value
                                          ? 'assets/svg/CheckboxActive.svg'
                                          : 'assets/svg/Checkbox.svg',
                                      width: 20,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Guardar dirección',
                                      style: TypographyStyle.bodyRegularLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          CustomTextInput(
                            autofocus: false,
                            maxLines: 6,
                            formControlName: Fields.notes.name,
                            keyboardType: TextInputType.text,
                            label: 'Referencias adicionales',
                            hintText:
                                'Ingresa una descripción de la dirección o indicaciones de entrega',
                          ),
                          const SizedBox(height: 16),
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: 'Al continuar, aceptas los ',
                              style: TypographyStyle.bodyRegularMedium
                                  .copyWith(color: neutral800),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Términos y condiciones',
                                  style: TypographyStyle.bodyRegularMedium
                                      .copyWith(color: secondaryBase),
                                ),
                                TextSpan(
                                  text: ' y la ',
                                  style: TypographyStyle.bodyRegularMedium
                                      .copyWith(color: neutral800),
                                ),
                                TextSpan(
                                  text: 'Política de privacidad',
                                  style: TypographyStyle.bodyRegularMedium
                                      .copyWith(color: secondaryBase),
                                ),
                                TextSpan(
                                  text: ' de Estrellas.',
                                  style: TypographyStyle.bodyRegularMedium
                                      .copyWith(color: neutral800),
                                ),
                              ],
                            ),
                          ),

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
