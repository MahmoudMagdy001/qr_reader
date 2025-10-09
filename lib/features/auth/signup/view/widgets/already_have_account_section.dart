import 'package:flutter/material.dart';

import '../../../../../l10n/app_localizations.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({required this.localization, super.key});

  final AppLocalizations localization;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(localization.alreadyHaveAccount),
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text(localization.loginText),
      ),
    ],
  );
}
