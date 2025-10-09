import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/auth_header.dart';
import '../../../../core/widgets/theme_language_button.dart';
import '../../../scan/view/scan_view.dart';
import '../../../../l10n/app_localizations.dart';

import '../repo/login_repo_impl.dart';
import '../service/login_service.dart';
import '../view_model/login_cubit.dart';
import '../view_model/login_state.dart';
import 'widgets/create_account_section.dart';
import 'widgets/login_form_fields.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => LoginCubit(
        loginRepository: LoginRepositoryImpl(
          loginService: LoginService(),
          localization: localization,
        ),
      ),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.userData != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const ScanView()),
              );
            } else if (state.errorMessage != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
            }
          },
          builder: (context, state) {
            final isloading = state.isLoading;
            return SingleChildScrollView(
              child: Column(
                children: [
                  AuthHeader(
                    height: height,
                    width: width,
                    theme: theme,
                    title: localization.loginText,
                  ),
                  SizedBox(height: height * 0.1),
                  LoginFormFields(
                    localization: localization,
                    height: height,
                    theme: theme,
                    width: width,
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: formKey,
                  ),
                  SizedBox(height: height * 0.03),
                  CustomButton(
                    onPressed: isloading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              context.read<LoginCubit>().login(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                            }
                          },
                    width: width,
                    child: isloading
                        ? const CircularProgressIndicator()
                        : Text(localization.loginText),
                  ),

                  SizedBox(height: height * 0.05),
                  const Divider(thickness: 0.5),
                  SizedBox(height: height * 0.015),
                  CreateAccountSection(localization: localization),

                  ThemeLanguageButton(
                    localization: localization,
                    width: width,
                    theme: theme,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
