import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/providers/repositories/auth/auth_repository.dart';
import '../validator/custom_password_validator.dart';

enum Fields {
  email('email'),
  password('password'),
  passwordConfirmation('passwordConfirmation');

  const Fields(this.name);
  final String name;
}

class NewRegisterController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  MainController mainController = Get.find();
  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.email.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.email,
          ],
        ),
        Fields.password.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(8),
          ],
          asyncValidators: [
            CustomPasswordRegisterAsyncValidator(controller: this),
          ],
        ),
        Fields.passwordConfirmation.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(8),
          ],
        ),
      }, [
        Validators.mustMatch('password', 'passwordConfirmation')
      ]);

  RxBool isObscure = true.obs;
  RxBool isObscure2 = true.obs;

  RxnBool hasBetween8and20characters = RxnBool();
  RxnBool hasCapitalLetter = RxnBool();
  RxnBool hasNumber = RxnBool();
  RxnBool hasSpecialCharacters = RxnBool();
  RxBool hasAllValidatorsOK = false.obs;

  void onPasswordChanged(dynamic v) {
    String value = v.value.toString();
    if (v == null) {
      resetValidation();
      return;
    }

    hasBetween8and20characters.value = value.length >= 8 && value.length <= 20;
    hasCapitalLetter.value = value.contains(RegExp(r'[A-Z]'));
    hasNumber.value = value.contains(RegExp(r'[0-9]'));
    hasSpecialCharacters.value =
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    hasAllValidatorsOK.value = (hasBetween8and20characters.value ?? false) &&
        (hasCapitalLetter.value ?? false) &&
        (hasNumber.value ?? false) &&
        (hasSpecialCharacters.value ?? false);
  }

  void resetValidation() {
    hasBetween8and20characters.value = null;
    hasCapitalLetter.value = null;
    hasNumber.value = null;
    hasSpecialCharacters.value = null;
  }

  void obscurePressed() {
    isObscure.value = !isObscure.value;
  }

  void obscure2Pressed() {
    isObscure2.value = !isObscure2.value;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
