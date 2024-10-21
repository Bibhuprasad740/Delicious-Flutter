import 'package:flutter/material.dart';
import '../../global/constants.dart';
import '../../widgets/input_field.dart';
import '../../widgets/submit_button.dart';
import 'enter_otp_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var emailController = TextEditingController();

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
          // Main content (forget password form)
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
                      'Forgot Password',
                      style: TextStyle(
                        color: AppColors.primaryFont,
                        fontWeight: FontWeight.w800,
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(height: AppSizes.largeGap),
                    const Text(
                      'Enter your email to receive an OTP via email to reset the password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.secondaryFont,
                        fontWeight: FontWeight.w500,
                        fontSize: AppSizes.smallFont,
                      ),
                    ),
                    const SizedBox(height: AppSizes.largeGap),
                    const SizedBox(height: AppSizes.largeGap),
                    const SizedBox(height: AppSizes.largeGap),
                    InputField(
                      controller: emailController,
                      labelText: 'Your Email',
                      keyboardType: TextInputType.emailAddress,
                      onChanged: () {},
                    ),
                    const SizedBox(height: AppSizes.largeGap),
                    SubmitButton(
                      text: 'Send OTP',
                      onPressed: () {
                        // Handle otp send request
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const EnterOtpScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: AppSizes.largeGap),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Back to Login',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
