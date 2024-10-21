import 'package:flutter/material.dart';

import '../global/constants.dart';

class TabButton extends StatelessWidget {
  final VoidCallback onTap;
  final String imageUrl;
  final String title;
  final bool isSelected;
  const TabButton({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              height: 15,
              width: 15,
              color: isSelected ? AppColors.primary : AppColors.placeholder,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? AppColors.primary : AppColors.placeholder,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
