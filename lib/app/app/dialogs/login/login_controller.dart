import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../controllers/main_controller.dart';

enum Fields {
  email('email'),
  password('password');

  const Fields(this.name);
  final String name;
}

class LoginDialogController extends GetxController {
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
    mainController.openLoader();

    Future.delayed(Duration(seconds: 2), () {
      Get.back();
    });
    // Future.delayed(Duration(seconds: 2), () {
    //   mainController.setIsLoading(false);
    // });
    // String email = data[Fields.email.name].toString();
    // String password = data[Fields.password.name].toString();
  }

  void openRegisterDialog() {
    Get.back();
    mainController.openRegisterDialog();
  }
}
