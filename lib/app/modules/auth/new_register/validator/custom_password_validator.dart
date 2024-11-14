import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../controllers/new_register_controller.dart';

class CustomPasswordRegisterAsyncValidator extends AsyncValidator<dynamic> {
  CustomPasswordRegisterAsyncValidator({required this.controller});

  final NewRegisterController controller;

  @override
  Future<Map<String, dynamic>?> validate(
    AbstractControl<dynamic> control,
  ) async {
    if (!controller.hasAllValidatorsOK.value) {
      control.markAsTouched();
      return <String, dynamic>{'invalidPassword': false};
    }
    return null;
  }
}
