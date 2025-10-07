import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class SignupFormFileds extends StatefulWidget {
  const SignupFormFileds({
    required this.width,
    required this.height,
    required this.localization,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
    required this.formKey,
    super.key,
  });

  final double width;
  final double height;
  final AppLocalizations localization;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignupFormFileds> createState() => _SignupFormFiledsState();
}

class _SignupFormFiledsState extends State<SignupFormFileds> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
    child: Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 🔹 Phone
          TextFormField(
            controller: widget.phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.phone_rounded),
              label: Text(widget.localization.enterYourPhone),
            ),
            onTapUpOutside: (_) => FocusScope.of(context).unfocus(),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return widget.localization.requiredPhone;
              }
              final phoneRegex = RegExp(r'^\+?\d{10,15}$');
              if (!phoneRegex.hasMatch(value.trim())) {
                return widget.localization.enterValidPhone;
              }
              return null;
            },
          ),
          SizedBox(height: widget.height * 0.03),

          // 🔹 Email
          TextFormField(
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email_rounded),
              label: Text(widget.localization.enterYourEmail),
            ),
            onTapUpOutside: (_) => FocusScope.of(context).unfocus(),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return widget.localization.requiredEmail;
              }
              final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
              if (!emailRegex.hasMatch(value.trim())) {
                return widget.localization.enterValidEmail;
              }
              return null;
            },
          ),
          SizedBox(height: widget.height * 0.03),

          // 🔹 Password
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: widget.passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_rounded),
              label: Text(widget.localization.enterYourPassword),
              suffixIcon: IconButton(
                onPressed: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            onTapUpOutside: (_) => FocusScope.of(context).unfocus(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return widget.localization.requiredPassword;
              }
              if (value.length < 6) {
                return widget.localization.enterValidPassword;
              }
              return null;
            },
          ),
        ],
      ),
    ),
  );
}
