import 'package:flutter/material.dart';

import '../global/constants.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  const SubmitButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor = AppColors.primary,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(color: textColor),
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: AppSizes.largeFont,
          ),
        ),
      ),
    );
  }
}
