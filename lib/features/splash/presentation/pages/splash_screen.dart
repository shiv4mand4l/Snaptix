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
      if (!mounted) return;

      context.go(AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final height = constraints.maxHeight;
              final width = constraints.maxWidth;

              final bool isSmallHeight = height < 650;
              final bool isTablet = width >= 600;

              final double logoSize = isTablet
                  ? 120.w
                  : isSmallHeight
                  ? 84.w
                  : 100.w;

              final double logoIconSize = isTablet
                  ? 62.sp
                  : isSmallHeight
                  ? 44.sp
                  : 52.sp;

              final double topSpacing = isSmallHeight
                  ? 50.h
                  : isTablet
                  ? 100.h
                  : 70.h;

              final double bottomSpacing = isSmallHeight
                  ? 28.h
                  : isTablet
                  ? 70.h
                  : 50.h;

              return SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 60.w : 24.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: topSpacing),

                        // --------------------------------
                        // CENTER CONTENT
                        // --------------------------------
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Logo
                            Container(
                              width: logoSize,
                              height: logoSize,
                              decoration: BoxDecoration(
                                color: AppColors.surface.withValues(
                                  alpha: 0.12,
                                ),
                                borderRadius: BorderRadius.circular(28.r),
                                border: Border.all(
                                  color: AppColors.border,
                                  width: 1.5.w,
                                ),
                              ),
                              child: Icon(
                                Icons.qr_code_scanner_outlined,
                                size: logoIconSize,
                                color: AppColors.surface,
                              ),
                            ),

                            SizedBox(height: isSmallHeight ? 14.h : 20.h),

                            // App Name
                            Text(
                              AppStrings.appName,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.splashTitle,
                            ),

                            SizedBox(height: isSmallHeight ? 4.h : 8.h),

                            // Subtitle
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: isTablet ? 500.w : 330.w,
                              ),
                              child: Text(
                                AppStrings.splashTagline,
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.splashSubtitle,
                              ),
                            ),
                          ],
                        ),

                        // --------------------------------
                        // LOADING SECTION
                        // --------------------------------
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: isSmallHeight ? 30.h : 50.h),

                            LinearProgressIndicator(
                              minHeight: 4.h,
                              borderRadius: BorderRadius.circular(100.r),
                              backgroundColor: AppColors.surface.withValues(
                                alpha: 0.24,
                              ),
                              valueColor: const AlwaysStoppedAnimation(
                                AppColors.warning,
                              ),
                            ),

                            SizedBox(height: isSmallHeight ? 12.h : 20.h),

                            Text(
                              AppStrings.splashLoading,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.splashLoadingText,
                            ),

                            SizedBox(height: bottomSpacing),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
