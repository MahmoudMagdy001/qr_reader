import 'package:flutter/material.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../signup/view/signup_view.dart';

class CreateAccountSection extends StatelessWidget {
  const CreateAccountSection({required this.localization, super.key});
  final AppLocalizations localization;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(localization.loginCreateAccount),
      TextButton(
        onPressed: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const SignupView())),
        child: Text(localization.loginCreateButton),
      ),
    ],
  );
}
