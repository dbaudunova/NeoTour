import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_colors.dart';
import 'package:neo_tour/config/constants/app_styles.dart';

class TextFieldStyle extends StatelessWidget {
  const TextFieldStyle({
    super.key,
    required TextEditingController commentController,
    required this.hint,
    this.validator,
    this.onChanged,
  }) : _commentController = commentController;

  final TextEditingController _commentController;
  final String hint;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      controller: _commentController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: AppStyles.s14w400.copyWith(
          color: Colors.grey,
        ),
      ),
    );
  }
}
