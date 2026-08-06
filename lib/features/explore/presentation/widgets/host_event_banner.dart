import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/theme/app_theme.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

class HostEventBanner extends StatelessWidget {
  const HostEventBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bannerWidth = constraints.maxWidth;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              //----------------------------------------
              // Watermark Icon
              //----------------------------------------
              Positioned(
                right: -bannerWidth * 0.03,
                bottom: -bannerWidth * 0.03,
                child: Icon(
                  Icons.campaign_outlined,
                  size: bannerWidth * 0.32,
                  color: Colors.white.withValues(alpha: .12),
                ),
              ),

              //----------------------------------------
              // Content
              //----------------------------------------
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //----------------------------------------
                  // Icon
                  //----------------------------------------
                  Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: .18),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Icon(
                      Icons.edit_calendar_rounded,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),

                  SizedBox(height: 14.h),

                  //----------------------------------------
                  // Title
                  //----------------------------------------
                  Text(
                    "Host Your Own Event",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyLarge,
                  ),

                  SizedBox(height: 8.h),

                  //----------------------------------------
                  // Description
                  //----------------------------------------
                  Text(
                    "Reach thousands of event-goers and manage your bookings seamlessly.",
                    style: AppTextStyles.labelMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 20.h),

                  //----------------------------------------
                  // Button
                  //----------------------------------------
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: AppTheme.lightTheme.outlinedButtonTheme.style,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Create Event",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
