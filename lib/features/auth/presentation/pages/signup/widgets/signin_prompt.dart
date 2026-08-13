import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/text_styles.dart';

class SignInPrompt extends StatelessWidget {
  const SignInPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: Center(
        child: GestureDetector(
          onTap: () {
            context.pushReplacement(AppRoutes.signIn);
          },
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Already have an account? ',
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 13.sp,
                color: AppColors.textSecondary,
              ),
              children: [
                TextSpan(
                  text: 'Sign In',
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
    );
  }
}
