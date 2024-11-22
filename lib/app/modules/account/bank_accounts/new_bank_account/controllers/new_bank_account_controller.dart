import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';

enum Fields {
  name('name'),
  notes('notes'),
  address('address'),
  phone('phone');

  const Fields(this.text);
  final String text;
}

class NewBankAccountController extends GetxController {
  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.name.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
        ),
        Fields.address.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
        ),
        Fields.notes.name: FormControl<String>(),
        Fields.phone.name: FormControl<PhoneNumber>(
          value: const PhoneNumber(
            isoCode: IsoCode.CO,
            nsn: '',
          ),
          validators: [
            PhoneValidators.required,
            PhoneValidators.valid,
          ],
        ),
      });
}
