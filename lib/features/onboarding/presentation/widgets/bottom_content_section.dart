import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/text_styles.dart';

class BottomContentSection extends StatelessWidget {
  const BottomContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Book Tickets', style: AppTextStyles.h1),

        SizedBox(height: 4.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Text(
            'Secure your spot in seconds and enjoy instant entry to the most exclusive events.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmall.copyWith(height: 1.2),
          ),
        ),

        SizedBox(height: 22.h),

        /// Get Started Button
        SizedBox(
          width: double.infinity,
          height: 58.h,
          child: ElevatedButton(
            onPressed: () {
              context.pushReplacement(AppRoutes.signIn);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get Started',
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.w),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.surface,
                  size: 22.sp,
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 20.h),

        /// Sign In
        GestureDetector(
          onTap: () {
            context.pushReplacement(AppRoutes.signUp);
          },
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textSecondary.withValues(alpha: 0.7),
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(text: 'Already have an account? '),
                TextSpan(
                  text: 'Sign Up',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
