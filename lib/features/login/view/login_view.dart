import 'package:flutter/material.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/theme_language_button.dart';
import 'widgets/login_form_fields.dart';
import 'widgets/login_header.dart';
import '../../scan/view/scan_view.dart';
import '../../../l10n/app_localizations.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginHeader(
              height: height,
              width: width,
              theme: theme,
              localization: localization,
            ),
            SizedBox(height: height * 0.1),
            LoginFormFields(
              localization: localization,
              height: height,
              theme: theme,
            ),
            SizedBox(height: height * 0.03),
            CustomButton(
              text: localization.loginText,
              onPressed: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => const ScanView())),
            ),
            SizedBox(height: height * 0.05),
            Divider(thickness: 0.5, color: theme.dividerColor),
            SizedBox(height: height * 0.015),
            ThemeLanguageButton(
              localization: localization,
              width: width,
              theme: theme,
            ),
          ],
        ),
      ),
    );
  }
}
