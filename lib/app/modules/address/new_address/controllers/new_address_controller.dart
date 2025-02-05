import 'package:dartz/dartz.dart';
import 'package:flutter_estrellas/app/components/snackbars/snackbars.dart';
import 'package:flutter_estrellas/app/data/models/address/address_model.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/address/address_repository.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/models/city/city/city_model.dart';
import '../../../../data/models/city/department/department_model.dart';
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
  AddressModel? address = Get.arguments;

  String addressId = '';
  RxBool editMode = false.obs;

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.name.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
          value: address?.fullname,
        ),
        Fields.address.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
          value: address?.address,
        ),
        Fields.notes.name: FormControl<String>(
          value: address?.notes,
        ),
        Fields.phone.name: FormControl<PhoneNumber>(
          value: PhoneNumber(
            isoCode: IsoCode.CO,
            nsn: address?.phone?.number ?? '',
          ),
          validators: [
            PhoneValidators.required,
            PhoneValidators.valid,
          ],
        ),
      });

  @override
  void onInit() {
    editMode.value = address != null;
    _departmentsList.bindStream(_repository.getDepartments());

    departmentSelected.listen((departmentId) {
      if (departmentId != null && departmentId.isNotEmpty) {
        _cityList.bindStream(_repository.getCities(departmentId));
      } else {
        _cityList.clear();
      }
    });

    if (editMode.value) {
      addressId = address!.id;
      saveAddress.value = address!.save ?? true;
      departmentSelected.value = address!.department!.dropiId.toString();
      citySelected.value = address!.city!.id.toString();
    }

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

  CityModel? getCityById(String id) {
    CityModel? option =
        cityList.firstWhereOrNull((element) => element.id == id);

    return option;
  }

  DepartmentModel? getDepartmentById(String id) {
    DepartmentModel? option = departmentsList
        .firstWhereOrNull((element) => element.dropiId.toString() == id);

    return option;
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    if (departmentSelected.value == null) {
      departmentError.value = 'Elige un departamento';
      return;
    }

    DepartmentModel? _departmentModel =
        getDepartmentById(departmentSelected.value!);

    if (_departmentModel == null) {
      cityError.value = 'Elige un departamento válido';
      return;
    }
    if (citySelected.value == null) {
      cityError.value = 'Elige una ciudad';
      return;
    }

    CityModel? _cityModel = getCityById(citySelected.value!);

    if (_cityModel == null) {
      cityError.value = 'Elige una ciudad válida';
      return;
    }

    String name = data[Fields.name.name].toString();
    String address = data[Fields.address.name].toString();
    String notes = data[Fields.notes.name].toString();

    PhoneNumber phone = data[Fields.phone.name] as PhoneNumber;

    mainController.showLoader(
      title: 'Verificando dirección',
    );

    Either<String, AddressModel> response;

    if (editMode.value) {
      response = await _repository.updateAddress(
        addressId: addressId,
        fullname: name,
        city: _cityModel,
        department: _departmentModel,
        address: address,
        phone: phone,
        notes: notes,
        save: saveAddress.value,
      );
    } else {
      response = await _repository.addAddress(
        fullname: name,
        city: _cityModel,
        department: _departmentModel,
        address: address,
        phone: phone,
        notes: notes,
        save: saveAddress.value,
      );
    }

    Get.back();
    response.fold((failure) {
      Snackbars.error(failure);
    }, (AddressModel addressModel) async {
      if (editMode.value) {
        Get.back();

        Snackbars.success('Dirección editada correctamente');
      } else {
        Snackbars.success('Dirección agregada correctamente');
        Get.offNamed(Routes.SELECT_PAYMENT, arguments: addressModel);
      }
    });
  }
}
