import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80.w,
          width: 80.w,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.lock_reset_rounded,
            size: 42.sp,
            color: AppColors.primary,
          ),
        ),

        SizedBox(height: 28.h),

        Text(
          'Forgot Password?',
          textAlign: TextAlign.center,
          style: AppTextStyles.h1.copyWith(color: AppColors.primary),
        ),

        SizedBox(height: 12.h),

        Text(
          'No worries! Enter your email address and '
          'we’ll send you a link to reset your password.',
          textAlign: TextAlign.center,
          style: AppTextStyles.labelExtraSmall.copyWith(
            letterSpacing: 1.2,
            height: 1.2,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
