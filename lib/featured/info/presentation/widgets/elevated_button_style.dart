import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_styles.dart';

class ElevatedButtonStyle extends StatelessWidget {
  const ElevatedButtonStyle({
    super.key,
    required this.onPressed,
    required this.text,
     this.backgroundColor,
  });

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.5),
        child: Text(text, style: AppStyles.s18w400),
      ),
    );
  }
}
