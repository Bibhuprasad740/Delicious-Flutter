import 'package:flutter/material.dart';

import '../global/constants.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const SquareTile({
    super.key,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(16),
          color: AppColors.background,
        ),
        child: Image.asset(
          imagePath,
          height: 35,
          width: 35,
        ),
      ),
    );
  }
}
