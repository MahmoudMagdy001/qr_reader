import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class ScanHeader extends StatelessWidget {
  const ScanHeader({
    required this.localization,
    required this.theme,
    required this.height,
    super.key,
  });
  final AppLocalizations localization;
  final ThemeData theme;
  final double height;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      SizedBox(height: height * 0.06),
      Text(
        textAlign: TextAlign.center,
        localization.scanText1,
        style: theme.textTheme.bodyMedium,
      ),
      SizedBox(height: height * 0.003),
      Text(
        textAlign: TextAlign.center,
        localization.scanText2,
        style: theme.textTheme.bodyMedium,
      ),
    ],
  );
}
