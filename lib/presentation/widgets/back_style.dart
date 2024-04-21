import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_styles.dart';

class BackStyle extends StatelessWidget {
  const BackStyle({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0),
      ),
      label: Text(
        text,
        style: AppStyles.s16w600.copyWith(fontWeight: FontWeight.normal),
      ),
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.white,
      ),
    );
  }
}
