import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../app/controllers/user_product_controller.dart';
import '../../../../components/snackbars/snackbars.dart';
import '../../../../data/providers/repositories/auth/auth_repository.dart';

enum Fields {
  email('email');

  const Fields(this.name);
  final String name;
}

class ForgotPasswordController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  MainController mainController = Get.find<MainController>();
  UserProductController userProductController =
      Get.find<UserProductController>();

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.email.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.email,
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

    Either<String, Unit> authFailureOrSuccessOption =
        await _authRepository.sendPasswordResetEmail(email: email);

    authFailureOrSuccessOption.fold(
      (failure) {
        Get.back();
        Snackbars.error(failure);
      },
      (_) async {
        Get.back();
        Get.back();
      },
    );
  }
}
