import 'package:flutter/material.dart';
import '../../../../../l10n/app_localizations.dart';

class LoginFormFields extends StatefulWidget {
  const LoginFormFields({
    required this.localization,
    required this.height,
    required this.theme,
    required this.width,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    super.key,
  });

  final AppLocalizations localization;
  final double height;
  final ThemeData theme;
  final double width;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  State<LoginFormFields> createState() => _LoginFormFieldsState();
}

class _LoginFormFieldsState extends State<LoginFormFields> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
    child: Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // حقل البريد الإلكتروني
          TextFormField(
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email_rounded),
              label: Text(widget.localization.enterYourEmail),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return widget.localization.requiredEmail;
              }
              if (!value.contains('@')) {
                return widget.localization.enterValidEmail;
              }
              return null;
            },
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
          ),
          SizedBox(height: widget.height * 0.03),

          // حقل كلمة المرور
          TextFormField(
            controller: widget.passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_rounded),
              label: Text(widget.localization.enterYourPassword),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return widget.localization.requiredPassword;
              }
              if (value.length < 6) {
                return widget.localization.enterValidPassword;
              }
              return null;
            },
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
          ),

          SizedBox(height: widget.height * 0.008),

          // زر نسيان كلمة المرور
          TextButton(
            onPressed: () {},
            child: Text(
              widget.localization.forgetPassword,
              style: widget.theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    ),
  );
}
