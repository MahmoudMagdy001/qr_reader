import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class ResultHeader extends StatelessWidget {
  const ResultHeader({
    required this.height,
    required this.theme,
    required this.localization,
    super.key,
  });
  final double height;
  final ThemeData theme;
  final AppLocalizations localization;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      SizedBox(height: height * 0.06),
      Center(
        child: Text(
          localization.resultText1,
          style: theme.textTheme.bodyMedium,
        ),
      ),
      SizedBox(height: height * 0.003),
      Center(
        child: Text(
          localization.resultText2,
          style: theme.textTheme.bodyMedium,
        ),
      ),
      SizedBox(height: height * 0.003),
      Center(
        child: Text(
          localization.resultText3,
          style: theme.textTheme.bodyMedium,
        ),
      ),
    ],
  );
}
