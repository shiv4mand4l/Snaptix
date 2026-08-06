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
        context.go(AppRoutes.main);
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
          child: Column(
            children: [
              const Spacer(),

              // Logo
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: AppColors.surface.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: AppColors.border, width: 1.5.w),
                ),
                child:
                    // SizedBox(
                    //   width: 100.w,
                    //   height: 100.h,
                    //   child:
                    //   Image.asset(AppIcons.snaptixLogo, fit: BoxFit.contain),
                    // ),
                    Icon(
                      Icons.qr_code_scanner_outlined,

                      color: AppColors.surface,
                      size: 52.sp,
                    ),
              ),

              SizedBox(height: 20.h),

              // App Name
              Text(AppStrings.appName, style: AppTextStyles.splashTitle),

              SizedBox(height: 8.h),

              // Subtitle
              Text(
                AppStrings.splashTagline,
                style: AppTextStyles.splashSubtitle,
              ),

              Spacer(),

              // Loading Indicator
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: LinearProgressIndicator(
                  minHeight: 4.h,
                  borderRadius: BorderRadius.all(Radius.circular(100.r)),
                  backgroundColor: AppColors.surface.withValues(alpha: 0.24),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.warning, // Ticket Yellow
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                AppStrings.splashLoading,
                style: AppTextStyles.splashLoadingText,
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
