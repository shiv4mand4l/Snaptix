import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/routes/app_routes.dart';
import 'package:flutter_task/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_task/features/auth/presentation/widgets/auth_logo.dart';
import 'package:flutter_task/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:flutter_task/shared/widgets/snaptix_app_bar_widget.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/text_styles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      resizeToAvoidBottomInset: true,
      appBar: SnaptixAppBarWidget(
        showLogo: false,
        title: '',
        backgroundColor: Colors.transparent,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SizedBox(
            height: 1.sh - MediaQuery.of(context).padding.top,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                // ---------------------------
                // Logo
                // ---------------------------
                Center(
                  child: const AuthLogo(logo: Icons.qr_code_scanner_outlined),
                ),

                SizedBox(height: 30.h),

                // ---------------------------
                // Title
                // ---------------------------
                Text(
                  "Create Account",
                  style: AppTextStyles.h2.copyWith(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff202124),
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  "Create your account to get started",
                  style: AppTextStyles.h2.copyWith(
                    fontSize: 15.sp,
                    color: Colors.grey.shade600,
                  ),
                ),

                SizedBox(height: 35.h),

                // ---------------------------
                // Full Name
                // ---------------------------
                AuthTextField(
                  prefixIcon: Icons.person_outline,
                  hintText: 'Full Name',
                ),

                SizedBox(height: 14.h),

                // ---------------------------
                // Email
                // ---------------------------
                AuthTextField(
                  prefixIcon: Icons.email_outlined,
                  hintText: 'Email',
                ),

                SizedBox(height: 14.h),

                // ---------------------------
                // Password
                // ---------------------------
                AuthTextField(
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: Icons.visibility_off_outlined,
                  hintText: 'Password',
                  obscureText: true,
                  onSuffixTap: () {},
                ),

                SizedBox(height: 14.h),

                // ---------------------------
                // Confirm Password
                // ---------------------------
                AuthTextField(
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: Icons.visibility_off_outlined,
                  hintText: 'Confirm Password',
                  obscureText: true,
                  onSuffixTap: () {},
                ),

                ///
                SizedBox(height: 18.h),

                // ---------------------------
                // Sign Up
                // ---------------------------
                AuthPrimaryButton(
                  text: 'Create Account',
                  onPressed: () {
                    context.go(AppRoutes.main);
                  },
                ),

                SizedBox(height: 35.h),

                // ---------------------------
                // Sign In
                // ---------------------------
                Padding(
                  padding: EdgeInsets.only(bottom: 25.h),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        context.pushReplacement(AppRoutes.signIn);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: AppTextStyles.bodySmall.copyWith(
                            fontSize: 13.sp,
                          ),
                          children: [
                            TextSpan(
                              text: "Login",
                              style: AppTextStyles.labelExtraSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
