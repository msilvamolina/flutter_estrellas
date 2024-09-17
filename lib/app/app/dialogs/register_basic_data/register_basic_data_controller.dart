import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../components/snackbars/snackbars.dart';
import '../../../data/providers/repositories/auth/auth_repository.dart';
import '../../../data/providers/repositories/auth/user_repository.dart';
import '../../controllers/main_controller.dart';

enum Fields {
  document('document'),
  username('username'),
  firstName('firstName'),
  lastName('lastName');

  const Fields(this.name);
  final String name;
}

class RegisterBasicDataDialogController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  MainController mainController = Get.find();

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.document.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(6),
            Validators.number()
          ],
        ),
        Fields.username.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(6),
          ],
        ),
        Fields.firstName.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(3),
          ],
        ),
        Fields.lastName.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(3),
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

  void openLoginDialog() {
    Get.back();
    mainController.openLoginDialog();
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    mainController.showLoader(
      title: 'Registrando...',
      message: 'Por favor espere',
    );
    String document = data[Fields.document.name].toString();
    String username = data[Fields.username.name].toString();
    String firstName = data[Fields.firstName.name].toString();
    String lastName = data[Fields.lastName.name].toString();

    Either<String, Unit> saveUserData =
        await mainController.userRepository.saveUserData(
      document: document,
      username: username,
      firstName: firstName,
      lastName: lastName,
    );

    Get.back();

    saveUserData.fold(
      (failure) => Snackbars.error(failure),
      (_) {
        Get.back();
        Get.back();
        mainController.checkUser(login: true);
      },
    );
  }
}
