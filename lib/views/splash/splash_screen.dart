import 'package:delicious/views/auth/welcome_page.dart';
import 'package:flutter/material.dart';

import '../../global/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToWelcomePage();
  }

  void navigateToWelcomePage() async {
    // TODO: change page push
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/splash_bg.png',
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          Hero(
            tag: 'Logo',
            child: Image.asset(
              'assets/images/app_logo.png',
              height: size.height * 0.4,
              width: size.width * 0.4,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
