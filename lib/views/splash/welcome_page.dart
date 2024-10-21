import 'package:flutter/material.dart';
import '../../global/constants.dart';
import '../../widgets/submit_button.dart';
import '../auth/login_screen.dart';
import '../auth/signup_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var size = Utils.getSize(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Limit the height of the top section using Container
            SizedBox(
              height: size.height * 0.6, // Adjust height as per requirement
              width: size.width,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/welcome.png',
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Hero(
                      tag: 'Logo',
                      child: Image.asset(
                        'assets/images/app_logo.png',
                        height: size.height * 0.2,
                        width: size.width * 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.largePadding),
              child: Text(
                'Discover the best foods from over 100+ dishes and fast delivery to your doorsteps',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.secondaryFont),
              ),
            ),

            SizedBox(height: size.height * 0.05),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.largePadding),
              child: SubmitButton(
                text: 'Login',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.largePadding),
              child: SubmitButton(
                text: 'Create an Account',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ));
                },
                buttonColor: AppColors.background,
                textColor: AppColors.primary,
              ),
            ),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
