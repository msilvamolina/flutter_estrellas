import 'package:dartz/dartz.dart';
import 'package:flutter_estrellas/app/components/snackbars/snackbars.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/address/address_repository.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/models/city/city/city_model.dart';
import '../../../../data/models/city/department/department_model.dart';
import '../../../../data/models/provider/provider/provider_model.dart';
import '../../../../routes/app_pages.dart';

enum Fields {
  name('name'),
  notes('notes'),
  address('address'),
  phone('phone');

  const Fields(this.text);
  final String text;
}

class NewAddressController extends GetxController {
  MainController mainController = Get.find();
  final AddressRepository _repository = AddressRepository();

  final RxList<DepartmentModel> _departmentsList = <DepartmentModel>[].obs;
  List<DepartmentModel> get departmentsList => _departmentsList.toList();

  final RxList<CityModel> _cityList = <CityModel>[].obs;
  List<CityModel> get cityList => _cityList.toList();

  RxnString departmentSelected = RxnString();
  RxnString departmentError = RxnString();

  RxnString citySelected = RxnString();
  RxnString cityError = RxnString();

  bool _formIsSubmitted = false;
  bool get formIsSubmitted => _formIsSubmitted;

  RxBool saveAddress = true.obs;

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.name.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
        ),
        Fields.address.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
        ),
        Fields.notes.name: FormControl<String>(),
        Fields.phone.name: FormControl<PhoneNumber>(
          value: const PhoneNumber(
            isoCode: IsoCode.CO,
            nsn: '',
          ),
          validators: [
            PhoneValidators.required,
            PhoneValidators.valid,
          ],
        ),
      });

  @override
  void onInit() {
    _departmentsList.bindStream(_repository.getDepartments());

    departmentSelected.listen((departmentId) {
      if (departmentId != null && departmentId.isNotEmpty) {
        _cityList.bindStream(_repository.getCities(departmentId));
      } else {
        _cityList.clear();
      }
    });

    super.onInit();
  }

  void onSaveAddressChanged() {
    saveAddress.value = !saveAddress.value;
  }

  void onDepartmentSelected(String? value) {
    departmentError.value = null;
    if (value != null) {
      departmentSelected.value = value;
      citySelected.value = null;
      fetchCities(value);
    } else {
      departmentSelected.value = null;
      citySelected.value = null;
    }
  }

  void fetchCities(String? departmentId) {
    if (departmentId != null) {
      _cityList.bindStream(_repository.getCities(departmentId));
    } else {
      _cityList.clear();
    }
  }

  void onCitySelected(String? value) {
    cityError.value = null;
    citySelected.value = value ?? '';
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    if (departmentSelected.value == null) {
      departmentError.value = 'Elige un departamento';
      return;
    }
    if (citySelected.value == null) {
      cityError.value = 'Elige una ciudad';
      return;
    }
    String name = data[Fields.name.name].toString();
    String address = data[Fields.address.name].toString();
    String phone = data[Fields.phone.name].toString();
    String notes = data[Fields.notes.name].toString();

    mainController.showLoader(
      title: 'Estamos validando tu pedido',
    );

    Future.delayed(Duration(seconds: 2), () {
      Get.back();
    });
    // Either<String, Unit> response = await _repository.addAddress(
    //   fullname: name,
    //   city: _cityModel!,
    //   address: address,
    //   phone: phone,
    //   notes: notes,
    // );
    // Get.back();
    // response.fold((failure) {
    //   Snackbars.error(failure);
    // }, (provider) async {
    //   Get.back();
    //   Snackbars.success('Dirección agregada correctamente');
    // });
  }
}
