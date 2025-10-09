import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../l10n/app_localizations.dart';
import '../../service/scan_service.dart';

class CameraScanView extends StatefulWidget {
  const CameraScanView({
    required this.localization,
    required this.height,
    required this.width,
    super.key,
  });
  final AppLocalizations localization;
  final double height;
  final double width;

  @override
  State<CameraScanView> createState() => _CameraScanViewState();
}

class _CameraScanViewState extends State<CameraScanView> {
  MobileScannerController cameraController = MobileScannerController();
  final ScanService _scanService = ScanService();
  bool _isFlashOn = false;
  bool _isScanned = false;

  Future<void> _handleBarcode(BarcodeCapture barcodes) async {
    final barcode = barcodes.barcodes.firstOrNull;
    if (_isScanned || barcode == null || barcode.rawValue == null) return;

    final result = barcode.rawValue!;
    setState(() => _isScanned = true);

    if (result.startsWith('http')) {
      _launchURL(result);
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(widget.localization.scanResult),
          content: Text(result),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() => _isScanned = false);
              },
              child: Text(widget.localization.done),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _launchURL(String result) async {
    try {
      await _scanService.saveScanResult(result);
      if (mounted) {
        await _scanService.handleUrl(
          result,
          context: context,
          localization: widget.localization,
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(widget.localization.saveError)));
      }
    }
  }

  void _toggleFlash() {
    setState(() {
      _isFlashOn = !_isFlashOn;
    });
    cameraController.toggleTorch();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.localization.scanTitle),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(_isFlashOn ? Icons.flash_on : Icons.flash_off),
          onPressed: _toggleFlash,
        ),
      ],
    ),
    backgroundColor: Colors.black,
    body: Stack(
      children: [
        MobileScanner(controller: cameraController, onDetect: _handleBarcode),
        Center(
          child: Container(
            width: widget.width * 0.8,
            height: widget.height * 0.4,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 3),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              widget.localization.scanFrame,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
