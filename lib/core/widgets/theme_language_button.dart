import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/localization_cubit.dart';
import '../cubits/theme_cubit.dart';
import '../../l10n/app_localizations.dart';

class ThemeLanguageButton extends StatelessWidget {
  const ThemeLanguageButton({
    required this.localization,
    required this.width,
    required this.theme,
    super.key,
  });
  final AppLocalizations localization;
  final double width;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        onPressed: () => context.read<LocalizationCubit>().toggleLanguage(),
        child: Text(localization.languageText),
      ),
      SizedBox(width: width * 0.05),
      ElevatedButton(
        onPressed: () => context.read<ThemeCubit>().toggleTheme(),
        child: Row(
          children: [
            Icon(
              theme.brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            SizedBox(width: width * 0.02),
            Text(localization.themeText),
          ],
        ),
      ),
    ],
  );
}
