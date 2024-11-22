import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';

enum Fields {
  fullname('fullname'),
  accountNumber('accountNumber'),
  document('document'),
  accountType('accountType');

  const Fields(this.text);
  final String text;
}

class NewBankAccountController extends GetxController {
  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.fullname.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
        ),
        Fields.accountType.name: FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        Fields.accountNumber.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(6),
          ],
        ),
        Fields.document.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(6),
          ],
        ),
      });

  List<String> banks = [
    'Avvillas',
    'Banco Agrario',
    'Banco Bogota',
    'Banco Compartir',
    'Banco Finandina',
    'Banco Multibank',
    'Banco Santander De Negocios Colombia Sa',
    'Bancolombia',
    'Bbva',
    'Bnp Paribas',
    'Caja Social Bcsc',
    'Citibank',
    'Colpatria',
    'Coltefinanciera',
    'Confiar Sa',
    'Coop Financiera De Antioquia',
    'Corpbanca',
    'Cotrafa Coop. Financiera',
    'Financiera Juridiscoop Cf',
    'Itau',
    'Nequi',
    'Occidente',
    'Popular',
    'Sudameris',
    'Davivienda',
    'Daviplata',
  ];

  List<String> documentType = [
    'Cédula de identidad',
    'Pasaporte',
  ];
}
