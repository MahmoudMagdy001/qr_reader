import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../l10n/app_localizations.dart';
import '../../results/service/qr_service.dart';

class ScanService {
  ScanService({QRHistoryService? qrHistoryService})
    : _qrHistoryService = qrHistoryService ?? QRHistoryService();
  final QRHistoryService _qrHistoryService;

  Future<void> saveScanResult(String result) async {
    await _qrHistoryService.addCode(result);
  }

  Future<void> handleUrl(
    String url, {
    required BuildContext context,
    required AppLocalizations localization,
  }) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${localization.urlError} $url')),
        );
      }
    }
  }
}
