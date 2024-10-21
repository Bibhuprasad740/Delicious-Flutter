import 'package:flutter/material.dart';
import '../../global/constants.dart';
import '../../widgets/action_text_row.dart';
import '../../widgets/input_field.dart';
import '../../widgets/submit_button.dart';
import '../onboard/onboard_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var rememberMeController = false;

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
          // Main content (sign-up form)
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
                      'Sign Up',
                      style: TextStyle(
                        color: AppColors.primaryFont,
                        fontWeight: FontWeight.w800,
                        fontSize: 30.0,
                      ),
                    ),
                    const Text(
                      'Add your details to sign up',
                      style: TextStyle(
                        color: AppColors.secondaryFont,
                        fontWeight: FontWeight.w500,
                        fontSize: AppSizes.smallFont,
                      ),
                    ),
                    const SizedBox(height: AppSizes.largeGap),
                    InputField(
                      controller: nameController,
                      labelText: 'Full Name',
                      keyboardType: TextInputType.name,
                      onChanged: () {},
                    ),
                    const SizedBox(height: AppSizes.mediumGap),
                    InputField(
                      controller: emailController,
                      labelText: 'Your Email',
                      keyboardType: TextInputType.emailAddress,
                      onChanged: () {},
                    ),
                    const SizedBox(height: AppSizes.mediumGap),
                    InputField(
                      controller: mobileController,
                      labelText: 'Mobile Number',
                      keyboardType: TextInputType.phone,
                      onChanged: () {},
                    ),
                    const SizedBox(height: AppSizes.mediumGap),
                    InputField(
                      controller: addressController,
                      labelText: 'Address',
                      keyboardType: TextInputType.streetAddress,
                      onChanged: () {},
                    ),
                    const SizedBox(height: AppSizes.mediumGap),
                    InputField(
                      controller: passwordController,
                      labelText: 'Password',
                      obscureText: true,
                      onChanged: () {},
                    ),
                    const SizedBox(height: AppSizes.mediumGap),
                    InputField(
                      controller: confirmPasswordController,
                      labelText: 'Confirm Password',
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
                      text: 'Sign Up',
                      onPressed: () {
                        // Handle sign-up action
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const OnboardScreen(),
                        ));
                      },
                    ),
                    const SizedBox(height: AppSizes.mediumGap),
                    ActionTextRow(
                      mainText: 'Already have an account?',
                      actionText: ' Login',
                      onTap: () {
                        Navigator.pop(context);
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
