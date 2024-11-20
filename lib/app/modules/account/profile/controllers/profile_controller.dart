import 'package:dartz/dartz.dart';
import 'package:flutter_estrellas/app/app/controllers/main_controller.dart';
import 'package:flutter_estrellas/app/data/models/phone/phone_model.dart';
import 'package:flutter_estrellas/app/data/models/user_data/user_data.dart';
import 'package:flutter_estrellas/app/data/providers/repositories/auth/user_repository.dart';
import 'package:flutter_estrellas/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';

import '../../../../components/snackbars/snackbars.dart';
import '../../../../data/providers/repositories/auth/auth_repository.dart';
import '../../../../utils/utils_image.dart';

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
  final UserRepository _repository = UserRepository();

  MainController mainController = Get.find<MainController>();

  String? _imagePath;
  String? get imagePath => _imagePath;

  String? _imageNetwork;
  String? get imageNetwork => _imageNetwork;

  RxnString userTitle = RxnString();

  bool _isFullUser = false;
  bool get isFullUser => _isFullUser;

  @override
  void onReady() {
    userTitle.value = mainController.userData != null
        ? mainController.userData?.fullName
        : mainController.userEmail;
    checkFullUser();
    update(['photo_card']);

    super.onReady();
  }

  void checkFullUser() {
    _imageNetwork = mainController.userData?.imageUrl;

    if (mainController.userData != null) {
      if (_imageNetwork != null) {
        _isFullUser = true;
      }
    }
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.fullname.name: FormControl<String>(
          value: mainController.userData?.fullName,
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
          value: mainController.userData?.document,
          validators: [
            Validators.required,
            Validators.number(allowedDecimals: 0),
            Validators.minLength(8),
          ],
        ),
        Fields.phone.name: FormControl<PhoneNumber>(
          value: PhoneNumber(
            isoCode: IsoCode.fromJson(
                mainController.userData?.phone?.isoCode ?? 'CO'),
            nsn: mainController.userData?.phone?.number ?? '',
          ),
          validators: [
            PhoneValidators.required,
            PhoneValidators.valid,
          ],
        ),
      });

  Future<void> pickImage() async {
    _imagePath = await UtilsImage.pickImage();
    update(['photo_card']);
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    String fullname = data[Fields.fullname.name].toString();
    String document = data[Fields.document.name].toString();
    String email = data[Fields.email.name].toString();
    PhoneNumber phone = data[Fields.phone.name] as PhoneNumber;

    PhoneModel newPhoneData = PhoneModel(
      number: phone.nsn,
      countryCode: phone.countryCode,
      isoCode: phone.isoCode.name,
    );

    bool canContinue = true;
    if (mainController.userData?.phone?.number != phone.nsn &&
        mainController.userData?.phone?.isoCode != phone.isoCode.name) {
      final result =
          await Get.toNamed(Routes.PHONE_VERIFICATION, arguments: newPhoneData);
      canContinue = result != null && result == 'OK';
    }

    if (canContinue) {
      mainController.showLoader(
        title: 'Guardando',
      );

      Either<String, String?> response = await _repository.saveUserData(
        document: document,
        phone: newPhoneData,
        fullName: fullname,
        email: email,
        imagePath: _imagePath,
        imageUrl: _imageNetwork,
      );
      Get.back();
      response.fold((failure) {
        Snackbars.error(failure);
      }, (String? image) async {
        mainController.reloadUserData();
        userTitle.value = fullname;
        _imageNetwork = image;
        _imagePath = null;
        checkFullUser();
        update(['photo_card']);
        Snackbars.success('Tu perfil se guardó exitosamente');
      });
    }
  }
}
