import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/controllers/main_controller.dart';
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
}
