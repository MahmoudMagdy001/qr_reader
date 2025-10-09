import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'core/cubits/localization_cubit.dart';
import 'core/cubits/theme_cubit.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/login/view/login_view.dart';
import 'features/scan/view/scan_view.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  static final _appTheme = AppThemeFactory();

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocalizationCubit>().state;
    final themeMode = context.watch<ThemeCubit>().state;

    return MaterialApp(
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
      theme: _appTheme.lightTheme,
      darkTheme: _appTheme.darkTheme,
      themeMode: themeMode,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged in
          if (snapshot.hasData) return const ScanView();
          // User is not logged in
          return const LoginView();
        },
      ),
    );
  }
}
