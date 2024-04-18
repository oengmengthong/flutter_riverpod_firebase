import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase/src/feature/auth/view_model/auth_model.dart';
import 'package:flutter_riverpod_firebase/src/feature/auth/view/login_form.dart';
import 'package:flutter_riverpod_firebase/src/shared/extensions/context_exts.dart';
import 'package:flutter_riverpod_firebase/src/shared/ui/with_loading_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../routers/app_router.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => 'The field is required',
      },
      child: ReactiveFormBuilder(
        form: loginForm,
        builder: (context, _, __) {
          return const LoginScreen();
        },
      ),
    );
  }
}

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider.notifier);
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(context.appTheme.spacing.gutter),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            'Login',
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
          ReactiveFormConsumer(
            builder: (context, form, child) {
              return ElevatedButton(
                  onPressed: form.valid && !authState.loading
                      ? () {
                          authController.logIn(
                            email: form.control('email').value as String,
                            password: form.control('password').value as String,
                          );
                        }
                      : null,
                  child: WithLoadingButton(
                    isLoading: authState.loading,
                    child: Text('Login'),
                  ));
            },
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              context.router.push(const RegisterRoute());
            },
            child: Text('Register'),
          ),
        ],
      ),
    ));
  }
}
