import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/theme/assets_name.dart';
import '../../../core/widgets/custom_button.dart';
import '../../login/view/login_view.dart';
import '../../results/view/result_view.dart';
import 'widgets/camera_scan_section.dart';
import 'widgets/camera_scan_view.dart';
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
          IconButton(
            onPressed: () async {
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
                      onPressed: () async {
                        Navigator.pop(context);
                        await FirebaseAuth.instance.signOut();

                        if (context.mounted) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ),
                          );
                        }
                      },
                      child: Text(localization.confirm),
                    ),
                  ],
                ),
              );
            },
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
              onPressed: () async {
                try {
                  final status = await Permission.camera.request();

                  if (status.isGranted && context.mounted) {
                    final result = await Navigator.of(context).push<String>(
                      MaterialPageRoute(
                        builder: (context) => CameraScanView(
                          localization: localization,
                          height: height,
                          width: width,
                        ),
                      ),
                    );

                    if (result != null &&
                        result.isNotEmpty &&
                        context.mounted) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ResultView(qrResult: result),
                        ),
                      );
                    }
                  } else if (status.isPermanentlyDenied) {
                    if (context.mounted) {
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
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${localization.unexpectedError} $e'),
                      ),
                    );
                  }
                }
              },
              width: width,
              child: Text(localization.scanButton),
            ),
          ],
        ),
      ),
    );
  }
}
