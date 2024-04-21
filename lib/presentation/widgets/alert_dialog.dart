import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_styles.dart';
import 'package:neo_tour/presentation/widgets/elevated_button_style.dart';

class AlertDialogStyle extends StatelessWidget {
  const AlertDialogStyle({
    super.key,
    required this.title,
    required this.buttonText,
  });

  final String title;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(title),
      titleTextStyle: AppStyles.s24w900.copyWith(
        fontWeight: FontWeight.w500,
      ),
      titlePadding: const EdgeInsets.only(top: 40),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(28),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(top: 32, bottom: 40),
      actions: [
        ElevatedButtonStyle(
          onPressed: () {},
          text: buttonText,
        ),
      ],
    );
  }
}
