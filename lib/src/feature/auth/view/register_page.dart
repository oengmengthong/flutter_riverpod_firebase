import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase/src/feature/auth/view/register_form.dart';
import 'package:flutter_riverpod_firebase/src/shared/extensions/context_exts.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../shared/widgets/transparent_app_bar.dart';
import '../../../shared/widgets/with_loading_button.dart';
import '../view_model/auth_riverpod.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => 'The field is required',
      },
      child: ReactiveFormBuilder(
        form: registerForm,
        builder: (context, _, __) {
          return const RegisterScreen();
        },
      ),
    );
  }
}

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider.notifier);
    final authState = ref.watch(authControllerProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TransparentAppBar.light(),
      body: Padding(
        padding: EdgeInsets.all(context.appTheme.spacing.gutter),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'Register',
              style: context.textTheme.headlineLarge,
            ),
            Spacer(),
            ReactiveTextField(
              formControlName: 'email',
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            ReactiveTextField(
              formControlName: 'password',
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            ReactiveTextField(
              formControlName: 'confirmPassword',
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
            ),
            SizedBox(height: 20),
            ReactiveFormConsumer(
              builder: (context, form, child) {
                return ElevatedButton(
                  onPressed: form.valid && !authState.loading
                      ? () {
                          authController.signUp(
                            email: form.control('email').value as String,
                            password: form.control('password').value as String,
                          );
                        }
                      : null,
                  child: WithLoadingButton(
                    isLoading: authState.loading,
                    child: Text('Register'),
                  ),
                );
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
