import 'package:dartz/dartz.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_svg/svg.dart';
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

enum FieldsRegister {
  email('email'),
  password('password'),
  passwordConfirmation('passwordConfirmation');

  const FieldsRegister(this.name);
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

  FormGroup buildFormRegister() => fb.group(<String, Object>{
        FieldsRegister.email.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.email,
          ],
        ),
        FieldsRegister.password.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(8),
          ],
        ),
        FieldsRegister.passwordConfirmation.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(8),
          ],
        ),
      }, [
        Validators.mustMatch('password', 'passwordConfirmation')
      ]);

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
        mainController.checkUser();
      },
    );
  }

  void openRegisterDialog() {
    Get.back();
    mainController.openRegisterDialog();
  }

  Future<void> sendFormRegister(Map<String, Object?> data) async {
    mainController.showLoader(
      title: 'Registrando...',
      message: 'Por favor espere',
    );
    String email = data[Fields.email.name].toString();
    String password = data[Fields.password.name].toString();

    Either<String, Unit> authFailureOrSuccessOption =
        await _authRepository.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    Get.back();

    authFailureOrSuccessOption.fold(
      (failure) => Snackbars.error(failure),
      (_) {
        Get.back();
        mainController.openRegisterBasicDataDialog();

        Snackbars.success('Bienvenido!');
      },
    );
  }
}
