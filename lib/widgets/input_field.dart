import 'package:flutter/material.dart';

import '../global/constants.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final VoidCallback onChanged;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  const InputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.textField,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      ),
      child: TextField(
        autocorrect: true,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: (prefixIcon != null)
              ? Icon(
                  prefixIcon,
                  color: AppColors.secondaryFont,
                )
              : null,
          contentPadding: EdgeInsets.symmetric(
            horizontal: (prefixIcon != null)
                ? AppSizes.extraLargePadding
                : AppSizes.largePadding,
            vertical: AppSizes.mediumPadding,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: labelText,
          hintStyle: const TextStyle(
            color: AppColors.secondaryFont,
            fontSize: AppSizes.smallFont,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
