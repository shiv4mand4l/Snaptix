import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/validators.dart';
import '../../../widgets/auth_primary_button.dart';
import '../../../widgets/auth_text_field.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  final VoidCallback onSignUp;

  const SignUpForm({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onSignUp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Full Name
        AuthTextField(
          controller: fullNameController,
          validator: AppValidators.fullName,
          prefixIcon: Icons.person_outline,
          hintText: 'Full Name',
        ),

        SizedBox(height: 14.h),

        // Email
        AuthTextField(
          controller: emailController,
          validator: AppValidators.email,
          prefixIcon: Icons.email_outlined,
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),

        SizedBox(height: 14.h),

        // Password
        AuthTextField(
          controller: passwordController,
          validator: AppValidators.password,
          prefixIcon: Icons.lock_outline,
          suffixIcon: Icons.visibility_off_outlined,
          hintText: 'Password',
          obscureText: true,
          onSuffixTap: () {},
        ),

        SizedBox(height: 14.h),

        // Confirm Password
        AuthTextField(
          controller: confirmPasswordController,
          validator: (value) {
            return AppValidators.confirmPassword(
              value,
              passwordController.text,
            );
          },
          prefixIcon: Icons.lock_outline,
          suffixIcon: Icons.visibility_off_outlined,
          hintText: 'Confirm Password',
          obscureText: true,
          onSuffixTap: () {},
        ),

        SizedBox(height: 18.h),

        // Create Account
        AuthPrimaryButton(text: 'Create Account', onPressed: onSignUp),
      ],
    );
  }
}
