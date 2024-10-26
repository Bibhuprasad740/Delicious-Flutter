import 'package:flutter/material.dart';

import '../global/constants.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const SectionHeader({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.primaryFont,
            fontSize: AppSizes.largeFont,
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onButtonPressed,
          child: Text(
            buttonText,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: AppSizes.extraSmallFont,
            ),
          ),
        ),
      ],
    );
  }
}
