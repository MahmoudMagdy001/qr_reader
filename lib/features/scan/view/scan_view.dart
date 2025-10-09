import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/theme/assets_name.dart';
import '../../../core/widgets/custom_button.dart';
import '../../auth/login/view/login_view.dart';
import '../../results/view/result_view.dart';
import 'widgets/camera_scan_section.dart';
import 'widgets/camera_scan_view.dart';
import 'widgets/scan_header.dart';
import '../../../l10n/app_localizations.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  void _navigateToResults(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const ResultView()));
  }

  void _showLogoutDialog(BuildContext context, AppLocalizations localization) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localization.logoutText),
        content: Text(localization.logoutConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(localization.cancel),
          ),
          TextButton(
            onPressed: () => _logout(context),
            child: Text(localization.confirm),
          ),
        ],
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    Navigator.pop(context);
    await FirebaseAuth.instance.signOut();

    if (context.mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    }
  }

  Future<void> _scanQRCode(BuildContext context) async {
    final localization = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;

    try {
      final status = await Permission.camera.request();

      if (status.isGranted && context.mounted) {
        Navigator.of(context).push<String>(
          MaterialPageRoute(
            builder: (context) => CameraScanView(
              localization: localization,
              height: size.height,
              width: size.width,
            ),
          ),
        );
      } else if (status.isPermanentlyDenied && context.mounted) {
        _showPermissionDeniedSnackbar(context, localization);
      }
    } catch (e) {
      _showErrorSnackbar(context, localization, e.toString());
    }
  }

  void _showPermissionDeniedSnackbar(
    BuildContext context,
    AppLocalizations localization,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(localization.cameraPermission),
        action: SnackBarAction(
          label: localization.openSettings,
          onPressed: () => openAppSettings(),
        ),
      ),
    );
  }

  void _showErrorSnackbar(
    BuildContext context,
    AppLocalizations localization,
    String error,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${localization.unexpectedError} $error')),
    );
  }

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
            onPressed: () => _navigateToResults(context),
            icon: SvgPicture.asset(
              Assets.resultIcon,
              width: 30,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          IconButton(
            onPressed: () => _showLogoutDialog(context, localization),
            icon: const Icon(Icons.logout_rounded),
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
            CustomButton(
              onPressed: () => _scanQRCode(context),
              width: width,
              child: Text(localization.scanButton),
            ),
          ],
        ),
      ),
    );
  }
}
