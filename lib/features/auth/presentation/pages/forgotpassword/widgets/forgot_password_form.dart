import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:flutter_task/features/auth/presentation/widgets/auth_text_field.dart';

import '../../../../../../core/utils/validators.dart';

class ForgotPasswordForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final VoidCallback onSubmit;

  const ForgotPasswordForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email Address',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),

          SizedBox(height: 8.h),

          AuthTextField(
            controller: emailController,
            validator: AppValidators.email,
            hintText: 'Enter your email',
            prefixIcon: Icons.email_outlined,
          ),

          SizedBox(height: 24.h),

          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: AuthPrimaryButton(
              text: 'Send Reset Link',
              onPressed: onSubmit,
            ),
          ),
        ],
      ),
    );
  }
}
