import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.text, super.key, this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 50),
    child: SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(onPressed: onPressed, child: Text(text)),
    ),
  );
}
