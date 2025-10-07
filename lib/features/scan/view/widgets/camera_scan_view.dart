import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../l10n/app_localizations.dart';

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
  bool _isFlashOn = false;
  bool _isScanned = false;

  final CollectionReference _scanResults = FirebaseFirestore.instance
      .collection('scan_results');

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${widget.localization.urlError} $url')),
        );
      }
    }
  }

  Future<void> _saveToFirestore(String result) async {
    try {
      await _scanResults.add({
        'result': result,
        'timestamp': FieldValue.serverTimestamp(),
        'type': result.startsWith('http') ? 'url' : 'text',
        'user_id': FirebaseAuth.instance.currentUser?.uid,
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(widget.localization.saveError)));
      }
    }
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    final barcode = barcodes.barcodes.firstOrNull;
    if (_isScanned || barcode == null || barcode.rawValue == null) return;

    final result = barcode.rawValue!;
    setState(() => _isScanned = true);

    _saveToFirestore(result);

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
