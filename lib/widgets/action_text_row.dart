import 'package:flutter/material.dart';

import '../global/constants.dart';

class ActionTextRow extends StatelessWidget {
  final String mainText;
  final String actionText;
  final VoidCallback onTap;
  final Color mainTextColor;
  final Color actionTextColor;
  final FontWeight actionTextWeight;
  final double textSize;

  const ActionTextRow({
    super.key,
    required this.mainText,
    required this.actionText,
    required this.onTap,
    this.mainTextColor = AppColors.primaryFont,
    this.actionTextColor = AppColors.primary,
    this.actionTextWeight = FontWeight.bold,
    this.textSize = AppSizes.mediumFont,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          mainText,
          style: TextStyle(
            color: mainTextColor,
            fontSize: textSize,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: TextStyle(
              color: actionTextColor,
              fontWeight: actionTextWeight,
              fontSize: textSize,
            ),
          ),
        ),
      ],
    );
  }
}
