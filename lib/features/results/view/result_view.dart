import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/assets_name.dart';
import '../../../core/widgets/custom_button.dart';
import 'widgets/result_header.dart';
import '../../../l10n/app_localizations.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final localization = AppLocalizations.of(context)!;

    final results = List.generate(10, (index) => 'Result item ${index + 1}');

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Scanning Result'),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 10),
        actions: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: SvgPicture.asset(
              Assets.backIcon,
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
            ResultHeader(
              height: height,
              theme: theme,
              localization: localization,
            ),
            SizedBox(height: height * 0.06),
            // هنا الليست الجديدة
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(height: height * 0.02),
                itemCount: results.length,
                itemBuilder: (context, index) => ListTile(
                  title: Row(
                    children: [
                      SvgPicture.asset(Assets.documentIcon, width: 40),
                      SizedBox(width: width * 0.06),
                      Text(results[index], style: theme.textTheme.titleMedium),
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: CustomButton(
                text: localization.resultButton,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
