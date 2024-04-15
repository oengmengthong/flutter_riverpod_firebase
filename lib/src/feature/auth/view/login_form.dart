import 'package:reactive_forms/reactive_forms.dart';

FormGroup loginForm() {
  return FormGroup({
    'email': FormControl<String>(
      validators: [
        Validators.required,
        Validators.email,
      ],
    ),
    'password': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
  });
}
