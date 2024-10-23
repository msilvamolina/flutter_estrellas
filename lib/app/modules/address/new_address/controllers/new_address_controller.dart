import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../data/models/city/city/city.dart';
import '../../../../data/models/city/department/department.dart';
import '../../../../routes/app_pages.dart';

enum Fields {
  name('name'),
  city('city'),
  address('address'),
  phone('phone');

  const Fields(this.text);
  final String text;
}

class NewAddressController extends GetxController {
  DepartmentModel? _departmentModel;
  DepartmentModel? get departmentModel => _departmentModel;

  CityModel? _cityModel;
  CityModel? get cityModel => _cityModel;

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
        Fields.phone.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(),
            Validators.minLength(4),
          ],
        ),
      });

  Future<void> pickCity() async {
    final result = await Get.toNamed(Routes.SELECT_DEPARTMENT);
    if (result != null) {
      _departmentModel = result[0];
      _cityModel = result[1];

      update(['view']);
    }
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    if (_cityModel == null) {
      Get.snackbar('Error', "Tienes que elegir una ciudad");
      return;
    }
    String name = data[Fields.name.name].toString();
    String address = data[Fields.address.name].toString();
    String phone = data[Fields.phone.name].toString();

    // _mainController.setDropiDialog(true);
    // _mainController.showDropiLoader();
    // _mainController.setDropiMessage('Iniciando conexión');

    // Either<String, ProviderModel> response = await _repository.createWarehouse(
    //   name: name,
    //   city: _cityModel!.dropiId.toString(),
    //   address: address,
    //   phone: phone,
    //   provider: providerModel.id,
    // );

    // response.fold((failure) {
    //   _mainController.setDropiDialogError(true, failure);
    // }, (provider) async {
    //   _mainController.setDropiMessage('Success!');
    //   await Future.delayed(const Duration(seconds: 1), () {
    //     saveInFirebase(provider: provider);
    //   });
    // });
  }
}
