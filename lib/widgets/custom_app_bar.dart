import 'package:flutter/material.dart';

import '../global/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size size;
  const CustomAppBar({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: size.height * 0.1,
      elevation: 15,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primary,
      centerTitle: true,
      title: const Text(
        'Delicious',
        style: TextStyle(
          color: Colors.white,
          fontSize: AppSizes.mediumFont,
          fontWeight: FontWeight.w800,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/shopping_cart.png',
            height: 25,
            width: 25,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size.height * 0.1);
}
