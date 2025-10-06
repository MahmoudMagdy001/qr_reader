import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({
    required this.localization,
    required this.height,
    required this.theme,
    super.key,
  });

  final AppLocalizations localization;
  final double height;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFormField(
          decoration: InputDecoration(label: Text(localization.enterYourPhone)),
          onTapUpOutside: (_) => FocusScope.of(context).unfocus(),
        ),
        SizedBox(height: height * 0.03),
        TextFormField(
          onTapUpOutside: (_) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
            label: Text(localization.enterYourPassword),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove_red_eye),
              color: const Color(0xff8B90A0),
            ),
          ),
        ),
        SizedBox(height: height * 0.008),
        TextButton(
          onPressed: () {},
          child: Text(
            localization.forgetPassword,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    ),
  );
}
