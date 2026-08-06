import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/routes/app_routes.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/auth_logo.dart';
import '../../widgets/auth_primary_button.dart';
import '../../widgets/auth_social_button.dart';
import '../../widgets/auth_text_field.dart';

class SigInScreen extends StatelessWidget {
  const SigInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // Allows screen to resize when keyboard opens
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

              padding: EdgeInsets.symmetric(horizontal: 24.w),

              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),

                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40.h),

                      // ---------------------------
                      // Logo
                      // ---------------------------
                      const AuthLogo(logo: Icons.qr_code_scanner_outlined),

                      SizedBox(height: 30.h),

                      // ---------------------------
                      // Title
                      // ---------------------------
                      Text(
                        'Welcome Back',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.h2.copyWith(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff202124),
                        ),
                      ),

                      SizedBox(height: 4.h),
                      Text(
                        'Sign in to continue',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.h2.copyWith(
                          fontSize: 15.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),

                      SizedBox(height: 35.h),

                      // ---------------------------
                      // Email
                      // ---------------------------
                      const AuthTextField(
                        hintText: 'Email',
                        prefixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      SizedBox(height: 18.h),

                      // ---------------------------
                      // Password
                      // ---------------------------
                      const AuthTextField(
                        hintText: 'Password',
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: Icons.visibility_off_outlined,
                        obscureText: true,
                      ),

                      // SizedBox(height: 2.h),

                      // ---------------------------
                      // Forgot Password
                      // ---------------------------
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: AppTextStyles.caption.copyWith(
                              fontSize: 14.sp,
                              color: AppColors.info.withValues(alpha: 0.7),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10.h),

                      // ---------------------------
                      // Login
                      // ---------------------------
                      AuthPrimaryButton(
                        text: 'Login',
                        onPressed: () {
                          context.pushReplacement(AppRoutes.main);
                        },
                      ),

                      SizedBox(height: 30.h),

                      // ---------------------------
                      // Divider
                      // ---------------------------
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(color: AppColors.border),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Text(
                              'Or continue with',
                              style: AppTextStyles.caption.copyWith(
                                color: Colors.grey,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),

                          const Expanded(
                            child: Divider(color: AppColors.border),
                          ),
                        ],
                      ),

                      SizedBox(height: 25.h),

                      // ---------------------------
                      // Google
                      // ---------------------------
                      AuthSocialLoginButton(
                        text: 'Google',
                        icon: Icons.g_mobiledata,
                        iconColor: AppColors.error,
                        onPressed: () {},
                      ),

                      // Push footer to bottom when
                      // enough screen space exists.
                      SizedBox(height: 30.h),

                      // ---------------------------
                      // Sign Up
                      // ---------------------------
                      Padding(
                        padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                        child: GestureDetector(
                          onTap: () {
                            context.push(AppRoutes.signUp);
                          },
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                                fontSize: 13.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign Up',
                                  style: AppTextStyles.bodyExtraMedium.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
