import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/theme/assets_name.dart';
import '../../../l10n/app_localizations.dart';
import '../service/qr_service.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key, this.qrResult});
  final String? qrResult;

  @override
  State<ResultView> createState() => _ResultView();
}

class _ResultView extends State<ResultView> {
  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  final QRHistoryService _qrHistoryService = QRHistoryService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(localization.resultTitle)),
      body: Column(
        children: [
          SizedBox(height: height * 0.02),
          Column(
            children: [
              Text(localization.resultText1),
              SizedBox(height: height * 0.003),
              Text(localization.resultText2),
              SizedBox(height: height * 0.003),
              Text(localization.resultText3),
            ],
          ),
          SizedBox(height: height * 0.02),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _qrHistoryService.userCodesStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('لا توجد أكواد في السجل.'));
                }

                final codes = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: codes.length,
                  itemBuilder: (context, index) {
                    final doc = codes[index];
                    final data = doc.data() as Map<String, dynamic>;
                    final String code = data['result'] ?? '';
                    final timestamp = data['timestamp'] as Timestamp?;

                    return ListTile(
                      leading: SvgPicture.asset(
                        Assets.documentIcon,
                        height: height * 0.04,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(code, style: theme.textTheme.titleMedium),
                          if (timestamp != null) ...[
                            SizedBox(height: height * 0.01),
                            Text(
                              timestamp.toDate().toString(),
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ],
                      ),
                      onTap: () {
                        if (code.startsWith('http')) {
                          _launchURL(code);
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ResultView(qrResult: code),
                            ),
                          );
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
