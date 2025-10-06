import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/assets_name.dart';
import '../../../core/widgets/custom_button.dart';
import '../../results/view/result_view.dart';
import 'widgets/accesiblity_section.dart';
import 'widgets/camera_scan_section.dart';
import 'widgets/scan_header.dart';
import '../../../l10n/app_localizations.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.scanTitle),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const ResultView())),
            icon: SvgPicture.asset(
              Assets.resultIcon,
              width: 30,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            ScanHeader(
              localization: localization,
              theme: theme,
              height: height,
            ),
            SizedBox(height: height * 0.1),
            CameraScanSection(height: height, localization: localization),
            SizedBox(height: height * 0.04),
            AccesiblitySection(width: width),
            SizedBox(height: height * 0.04),
            CustomButton(text: localization.scanButton, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
