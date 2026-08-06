import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/routes/app_routes.dart';
import 'package:go_router/go_router.dart';

class BottomContentSection extends StatelessWidget {
  const BottomContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Book Tickets',
          style: TextStyle(
            color: const Color(0xFF131526),
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
            fontFamily: 'serif',
          ),
        ),

        SizedBox(height: 12.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Secure your spot in seconds and enjoy instant entry to the most exclusive events.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF7E8494),
              fontSize: 15.sp,
              height: 1.45,
            ),
          ),
        ),

        SizedBox(height: 32.h),

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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'serif',
                  ),
                ),
                SizedBox(width: 8.w),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
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
            context.go(AppRoutes.signIn);
          },
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: const Color(0xFF7E8494), fontSize: 13.sp),
              children: const [
                TextSpan(text: 'Already have an account? '),
                TextSpan(
                  text: 'Sign In',
                  style: TextStyle(
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
