import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/data/models/phone/phone_model.dart';
import 'package:flutter_estrellas/app/data/models/user_data/user_data.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';

enum Fields {
  fullname('fullname'),
  document('document'),
  phone('phone'),
  email('email'),
  ;

  const Fields(this.text);
  final String text;
}

class ProfileController extends GetxController {
  MainController mainController = Get.find<MainController>();
  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.fullname.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
        ),
        Fields.email.name: FormControl<String>(
          value: mainController.userEmail,
          validators: [
            Validators.required,
            Validators.email,
          ],
        ),
        Fields.document.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(allowedDecimals: 0),
            Validators.minLength(8),
          ],
        ),
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
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    String fullname = data[Fields.fullname.name].toString();
    String document = data[Fields.document.name].toString();
    String email = data[Fields.email.name].toString();
    PhoneNumber phone = data[Fields.phone.name] as PhoneNumber;

    UserData newUserData = UserData(
      uid: mainController.userUID ?? '',
      fullName: fullname,
      email: email,
      document: document,
      phone: PhoneModel(
        number: phone.nsn,
        countryCode: phone.countryCode,
        isoCode: phone.isoCode.name,
      ),
    );
    // mainController.showLoader(
    //   title: 'Guardando',
    // );

    print('newUserData $newUserData');

    // Either<String, AddressModel> response = await _repository.addAddress(
    //   fullname: name,
    //   city: _cityModel,
    //   department: _departmentModel,
    //   address: address,
    //   phone: phone,
    //   notes: notes,
    //   save: saveAddress.value,
    // );
    // Get.back();
    // response.fold((failure) {
    //   Snackbars.error(failure);
    // }, (AddressModel addressModel) async {
    //   Snackbars.success('Dirección agregada correctamente');

    //   Get.offNamed(Routes.SELECT_PAYMENT, arguments: addressModel);
    // });
  }
}
