import 'package:flutter/material.dart';
import '../../global/constants.dart';
import '../../widgets/input_field.dart';
import '../../widgets/submit_button.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final bool _isObscuredNewPassword = true;
  final bool _isObscuredConfirmPassword = true;

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
          // Main content (Create new password form)
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
                      'New Password',
                      style: TextStyle(
                        color: AppColors.primaryFont,
                        fontWeight: FontWeight.w800,
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(height: AppSizes.largeGap),
                    const Text(
                      'Enter your new password below.This time remember your new password :)',
                      style: TextStyle(
                        color: AppColors.secondaryFont,
                        fontWeight: FontWeight.w500,
                        fontSize: AppSizes.smallFont,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSizes.largeGap),
                    const SizedBox(height: AppSizes.largeGap),
                    const SizedBox(height: AppSizes.largeGap),

                    // New Password Input Field
                    InputField(
                      controller: _newPasswordController,
                      labelText: 'New Password',
                      obscureText: _isObscuredNewPassword,
                      onChanged: () {},
                    ),

                    const SizedBox(height: AppSizes.mediumGap),

                    // Confirm Password Input Field
                    InputField(
                      controller: _confirmPasswordController,
                      labelText: 'Confirm Password',
                      obscureText: _isObscuredConfirmPassword,
                      onChanged: () {},
                    ),

                    const SizedBox(height: AppSizes.largeGap),

                    SubmitButton(
                      text: 'Create Password',
                      onPressed: () {
                        // Handle create password action
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
