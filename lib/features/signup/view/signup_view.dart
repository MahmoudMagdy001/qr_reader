import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/auth_header.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../l10n/app_localizations.dart';

import '../repo/signup_repo_impl.dart';
import '../service/signup_service.dart';
import '../view_model/signup_cubit.dart';
import '../view_model/signup_state.dart';
import 'widgets/already_have_account_section.dart';
import 'widgets/signup_form_fields.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phonecontroller = TextEditingController();
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

    return Scaffold(
      body: BlocProvider(
        create: (context) => SignupCubit(
          signupRepository: SignupRepositoryImpl(
            signupService: SignupService(),
            localization: localization,
          ),
        ),
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(localization.successCreateAccount)),
              );
              Navigator.pop(context);
            } else if (state is SignupFailure) {
              debugPrint(state.message);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            final isLoading = state is SignupLoading;
            return SingleChildScrollView(
              child: Column(
                children: [
                  AuthHeader(
                    height: height,
                    width: width,
                    theme: theme,
                    title: localization.signupText,
                  ),
                  SizedBox(height: height * 0.1),
                  SignupFormFileds(
                    width: width,
                    height: height,
                    localization: localization,
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: formKey,
                    phoneController: phonecontroller,
                  ),
                  SizedBox(height: height * 0.03),
                  CustomButton(
                    width: width,
                    onPressed: isLoading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              context.read<SignupCubit>().signup(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                phone: phonecontroller.text.trim(),
                              );
                            }
                          },
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : Text(localization.signupText),
                  ),
                  SizedBox(height: height * 0.05),
                  const Divider(thickness: 0.5),
                  SizedBox(height: height * 0.015),
                  AlreadyHaveAccount(localization: localization),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
