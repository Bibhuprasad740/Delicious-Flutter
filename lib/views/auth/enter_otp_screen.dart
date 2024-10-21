import 'package:flutter/material.dart';

import '../../global/constants.dart';
import '../../widgets/action_text_row.dart';
import '../../widgets/submit_button.dart';
import 'create_new_password_screen.dart';

class EnterOtpScreen extends StatefulWidget {
  const EnterOtpScreen({super.key});

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

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
          // Main content (OTP entry form)
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
                      'Enter OTP',
                      style: TextStyle(
                        color: AppColors.primaryFont,
                        fontWeight: FontWeight.w800,
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(height: AppSizes.largeGap),
                    const Text(
                      'An OTP has been sent to your email address.',
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

                    // OTP input fields
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildOtpInputField(
                            _otpController1, _focusNode1, _focusNode2),
                        const SizedBox(width: 10), // Space between input fields
                        _buildOtpInputField(
                            _otpController2, _focusNode2, _focusNode3),
                        const SizedBox(width: 10),
                        _buildOtpInputField(
                            _otpController3, _focusNode3, _focusNode4),
                        const SizedBox(width: 10),
                        _buildOtpInputField(_otpController4, _focusNode4, null),
                      ],
                    ),

                    const SizedBox(height: AppSizes.largeGap),
                    SubmitButton(
                      text: 'Verify OTP',
                      onPressed: () {
                        // Handle OTP verification
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const CreateNewPasswordScreen()));
                      },
                    ),
                    const SizedBox(height: AppSizes.largeGap),
                    ActionTextRow(
                      mainText: 'Didn\'t get OTP?',
                      actionText: ' Resend',
                      onTap: () {},
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

  Widget _buildOtpInputField(TextEditingController controller,
      FocusNode focusNode, FocusNode? nextFocusNode) {
    return SizedBox(
      width: 60, // Width of each OTP input field
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.placeholder, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primary, width: 3),
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0), // Adjust padding
        ),
        onChanged: (value) {
          if (value.length == 1 && nextFocusNode != null) {
            FocusScope.of(context)
                .requestFocus(nextFocusNode); // Move to next input
          }
          if (value.isEmpty && nextFocusNode != null) {
            FocusScope.of(context)
                .previousFocus(); // Move to previous input if empty
          }
        },
      ),
    );
  }
}
