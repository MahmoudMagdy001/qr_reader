import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/assets_name.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    required this.height,
    required this.width,
    required this.theme,

    required this.title,
    super.key,
  });

  final double height;
  final double width;
  final ThemeData theme;

  final String title;

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      SvgPicture.asset(Assets.circle1),
      Positioned(left: width * 0.5, child: SvgPicture.asset(Assets.circle2)),
      Column(
        children: [
          SizedBox(height: height * 0.14),
          Center(child: Text(title, style: theme.textTheme.headlineSmall)),
        ],
      ),
    ],
  );
}
