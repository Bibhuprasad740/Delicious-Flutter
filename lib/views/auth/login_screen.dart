import 'package:flutter/material.dart';

import '../../global/constants.dart';
import '../../widgets/action_text_row.dart';
import '../../widgets/input_field.dart';
import '../../widgets/square_tile.dart';
import '../../widgets/submit_button.dart';
import '../tab/tab_screen.dart';
import 'forget_passwrod_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rememberMeController = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background image that covers the entire screen
          SizedBox.expand(
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/images/splash_bg.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content (login form)
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    size.height, // Ensures the content fills the entire height
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.largePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.1),
                    const Text(
                      'Login',
                      style: TextStyle(
                        color: AppColors.primaryFont,
                        fontWeight: FontWeight.w800,
                        fontSize: 30.0,
                      ),
                    ),
                    const Text(
                      'Add your details to login',
                      style: TextStyle(
                        color: AppColors.secondaryFont,
                        fontWeight: FontWeight.w500,
                        fontSize: AppSizes.smallFont,
                      ),
                    ),
                    const SizedBox(height: AppSizes.largeGap),
                    InputField(
                      controller: emailController,
                      labelText: 'Your Email',
                      keyboardType: TextInputType.emailAddress,
                      onChanged: () {},
                    ),
                    const SizedBox(height: AppSizes.mediumGap),
                    InputField(
                      controller: passwordController,
                      labelText: 'Password',
                      obscureText: true,
                      onChanged: () {},
                    ),
                    const SizedBox(height: AppSizes.smallGap),
                    CheckboxListTile(
                      title: const Text(
                        'Remember Me',
                        style: TextStyle(
                          color: AppColors.primaryFont,
                        ),
                      ),
                      value: rememberMeController,
                      onChanged: (newValue) {
                        setState(() {
                          rememberMeController = newValue!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.primary,
                    ),
                    const SizedBox(height: AppSizes.largeGap),
                    SubmitButton(
                      text: 'Login',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TabScreen(),
                        ));
                      },
                    ),
                    const SizedBox(height: AppSizes.mediumGap),
                    ActionTextRow(
                        mainText: 'Forgot password?',
                        actionText: ' Reset',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ForgetPasswordScreen(),
                          ));
                        }),
                    const SizedBox(height: AppSizes.largeGap),
                    const Text(
                      'Or login with',
                      style: TextStyle(
                        color: AppColors.secondaryFont,
                      ),
                    ),
                    const SizedBox(height: AppSizes.largeGap),
                    SquareTile(
                      imagePath: 'assets/images/google.png',
                      onTap: () {},
                    ),
                    const SizedBox(height: AppSizes.largeGap),
                    ActionTextRow(
                      mainText: 'Don\'t have account?',
                      actionText: ' Register',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
