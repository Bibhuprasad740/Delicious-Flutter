import 'package:flutter/material.dart';

import '../global/constants.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final VoidCallback onChanged;
  final bool showPassword;
  final TextInputType keyboardType;

  const InputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.showPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      ),
      child: TextField(
        autocorrect: true,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSizes.mediumPadding,
            vertical: AppSizes.mediumPadding,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: labelText,
          hintStyle: const TextStyle(
            color: AppColors.placeholder,
            fontSize: AppSizes.smallFont,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
