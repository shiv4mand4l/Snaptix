import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/text_styles.dart';
import '../../../../../../core/utils/validators.dart';
import '../../../widgets/auth_primary_button.dart';
import '../../../widgets/auth_text_field.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const SignInForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
          controller: emailController,
          validator: AppValidators.email,
          hintText: 'Email',
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),

        SizedBox(height: 14.h),

        AuthTextField(
          controller: passwordController,
          validator: AppValidators.password,
          hintText: 'Password',
          prefixIcon: Icons.lock_outline,
          suffixIcon: Icons.visibility_off_outlined,
          obscureText: true,
        ),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              context.push(AppRoutes.forgotPassword);
            },
            child: Text(
              'Forgot Password?',
              style: AppTextStyles.caption.copyWith(
                fontSize: 14.sp,
                color: AppColors.primary.withValues(alpha: 0.6),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        AuthPrimaryButton(
          text: 'Sign In',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              // Todo: Trigger BLoC login event here.
              //
              // context.read<AuthBloc>().add(
              //   SignInEvent(
              //     email: emailController.text.trim(),
              //     password: passwordController.text,
              //   ),
              // );
            }
          },
        ),
      ],
    );
  }
}
