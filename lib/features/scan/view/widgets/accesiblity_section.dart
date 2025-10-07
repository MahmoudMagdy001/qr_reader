import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/assets_name.dart';

class AccesiblitySection extends StatelessWidget {
  const AccesiblitySection({required this.width, super.key});
  final double width;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? Colors.white : Colors.black;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            Assets.gelleryicon,
            width: width * 0.07,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
        ),
        SizedBox(width: width * 0.06),
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            Assets.blurIcon,
            width: width * 0.085,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
        ),
        SizedBox(width: width * 0.06),
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            Assets.flashIcon,
            width: width * 0.032,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
