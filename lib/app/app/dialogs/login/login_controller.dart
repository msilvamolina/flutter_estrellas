import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../components/snackbars/snackbars.dart';
import '../../../data/providers/repositories/auth/auth_repository.dart';
import '../../controllers/main_controller.dart';

enum Fields {
  email('email'),
  password('password');

  const Fields(this.name);
  final String name;
}

class LoginDialogController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  MainController mainController = Get.find();
  bool _buttonEnabled = true;
  bool get buttonEnabled => _buttonEnabled;

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
    _buttonEnabled = false;
    update(['loginButton']);
    mainController.showLoader(
      title: 'Iniciando sesión...',
      message: 'Por favor espere',
    );
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
        _buttonEnabled = true;
        update(['loginButton']);
        Snackbars.error(failure);
      },
      (_) {
        Get.back();
        Get.back();

        mainController.checkUser(login: true);
      },
    );
  }

  void openRegisterDialog() {
    Get.back();
    mainController.openRegisterDialog();
  }
}
