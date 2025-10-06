import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/assets_name.dart';
import '../../../../l10n/app_localizations.dart';

class CameraScanSection extends StatelessWidget {
  const CameraScanSection({
    required this.height,
    required this.localization,
    super.key,
  });
  final double height;
  final AppLocalizations localization;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      SvgPicture.asset(Assets.scanIcon, height: height * 0.25),
      SizedBox(height: height * 0.03),
      Text(localization.scanningQr),
    ],
  );
}
