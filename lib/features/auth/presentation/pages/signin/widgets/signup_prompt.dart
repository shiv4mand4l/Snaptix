import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/text_styles.dart';

class SignupPrompt extends StatelessWidget {
  const SignupPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
