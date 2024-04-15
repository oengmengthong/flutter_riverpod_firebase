import 'package:reactive_forms/reactive_forms.dart';

FormGroup registerForm(){
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
    'confirmPassword': FormControl<String>(
      validators: [
        Validators.required,
        Validators.mustMatch('password','confirmPassword')
      ],
    ),
  });
}