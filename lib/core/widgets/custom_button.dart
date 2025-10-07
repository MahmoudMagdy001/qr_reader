import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.width,
    required this.child,
    super.key,
    this.onPressed,
  });

  final Widget child;
  final void Function()? onPressed;
  final double width;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: width * 0.12),
    child: SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(onPressed: onPressed, child: child),
    ),
  );
}
