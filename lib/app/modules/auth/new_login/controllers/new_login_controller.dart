import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../components/snackbars/snackbars.dart';
import '../../../../data/providers/repositories/auth/auth_repository.dart';

enum Fields {
  email('email'),
  password('password');

  const Fields(this.name);
  final String name;
}

class NewLoginController extends GetxController {
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
        ),
      });

  RxBool isObscure = true.obs;

  void obscurePressed() {
    isObscure.value = !isObscure.value;
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    mainController.showLoader();
    String email = data[Fields.email.name].toString();
    String password = data[Fields.password.name].toString();

    Either<String, Unit> authFailureOrSuccessOption =
        await _authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    authFailureOrSuccessOption.fold(
      (failure) {
        Get.back();
        Snackbars.error(failure);
      },
      (_) {
        Get.back();
        Get.back();

        mainController.checkUser(login: true);
      },
    );
  }
}
