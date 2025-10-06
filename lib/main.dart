import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/cubits/localization_cubit.dart';
import 'core/cubits/theme_cubit.dart';

import 'core/theme/app_theme.dart';

import 'features/login/view/login_view.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LocalizationCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeFactory();

    return BlocBuilder<LocalizationCubit, Locale>(
      builder: (context, locale) => BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) => MaterialApp(
          themeAnimationStyle: const AnimationStyle(
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            reverseCurve: Curves.easeOut,
            reverseDuration: Duration(milliseconds: 500),
          ),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: locale,
          theme: appTheme.lightTheme,
          darkTheme: appTheme.darkTheme,
          themeMode: themeMode,
          home: const LoginView(),
        ),
      ),
    );
  }
}
