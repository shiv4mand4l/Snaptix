import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/constants/app_strings.dart';
import 'package:flutter_task/core/routes/app_routes.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go(AppRoutes.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                const Spacer(flex: 3),

                /// Logo
                Container(
                  width: 100.w,
                  height: 100.w,
                  decoration: BoxDecoration(
                    color: AppColors.surface.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(28.r),
                    border: Border.all(color: AppColors.border, width: 1.5.w),
                  ),
                  child: Icon(
                    Icons.qr_code_scanner_outlined,
                    size: 52.sp,
                    color: AppColors.surface,
                  ),
                ),

                SizedBox(height: 20.h),

                /// App Name
                Text(
                  AppStrings.appName,
                  style: AppTextStyles.splashTitle,
                  textAlign: TextAlign.center,
                ),

                // SizedBox(height: 8.h),

                /// Subtitle
                Text(
                  AppStrings.splashTagline,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.splashSubtitle,
                ),

                const Spacer(flex: 2),

                /// Loading Indicator
                LinearProgressIndicator(
                  minHeight: 4.h,
                  borderRadius: BorderRadius.circular(100.r),
                  backgroundColor: AppColors.surface.withValues(alpha: 0.24),
                  valueColor: const AlwaysStoppedAnimation(AppColors.warning),
                ),

                SizedBox(height: 20.h),

                Text(
                  AppStrings.splashLoading,
                  style: AppTextStyles.splashLoadingText,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 60.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
