import 'package:dartz/dartz.dart';
import 'package:flutter_estrellas/app/components/snackbars/snackbars.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/address/address_repository.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
  DepartmentModel? _departmentModel;
  DepartmentModel? get departmentModel => _departmentModel;

  CityModel? _cityModel;
  CityModel? get cityModel => _cityModel;

  final RxList<DepartmentModel> _departmentsList = <DepartmentModel>[].obs;
  List<DepartmentModel> get departmentsList => _departmentsList.toList();

  String? _departmentSelected;
  String? get departmentSelected => _departmentSelected;

  String? _departmentError;
  String? get departmentError => _departmentError;
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
        Fields.phone.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(),
            Validators.minLength(4),
          ],
        ),
      });

  @override
  void onInit() {
    _departmentsList.bindStream(_repository.getDepartments());
    super.onInit();
  }

  Future<void> pickCity() async {
    final result = await Get.toNamed(Routes.SELECT_DEPARTMENT);
    if (result != null) {
      _departmentModel = result[0];
      _cityModel = result[1];

      update(['view']);
    }
  }

  void onDepartmentSelected(String? value) {}
  Future<void> sendForm(Map<String, Object?> data) async {
    if (_cityModel == null) {
      Get.snackbar('Error', "Tienes que elegir una ciudad");
      return;
    }
    String name = data[Fields.name.name].toString();
    String address = data[Fields.address.name].toString();
    String phone = data[Fields.phone.name].toString();
    String notes = data[Fields.notes.name].toString();

    mainController.showLoader(
      title: 'Guardando...',
      message: 'Por favor espere',
    );
    Either<String, Unit> response = await _repository.addAddress(
      fullname: name,
      city: _cityModel!,
      address: address,
      phone: phone,
      notes: notes,
    );
    Get.back();
    response.fold((failure) {
      Snackbars.error(failure);
    }, (provider) async {
      Get.back();
      Snackbars.success('Dirección agregada correctamente');
    });
  }
}
