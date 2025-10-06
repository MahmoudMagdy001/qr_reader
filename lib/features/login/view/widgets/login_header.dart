import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/assets_name.dart';
import '../../../../l10n/app_localizations.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    required this.height,
    required this.width,
    required this.theme,
    required this.localization,
    super.key,
  });

  final double height;
  final double width;
  final ThemeData theme;
  final AppLocalizations localization;

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      SvgPicture.asset(Assets.circle1),
      Positioned(left: 200, child: SvgPicture.asset(Assets.circle2)),
      Positioned(
        top: height / 7,
        left: width / 2.4,
        child: Text(
          localization.loginText,
          style: theme.textTheme.headlineSmall,
        ),
      ),
    ],
  );
}
