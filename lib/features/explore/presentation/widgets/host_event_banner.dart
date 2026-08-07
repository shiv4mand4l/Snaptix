// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/theme/app_theme.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import 'package:flutter_task/features/explore/domain/entities/banner_entity.dart';

class HostEventBanner extends StatelessWidget {
  final BannerEntity bannerEntity;
  const HostEventBanner({super.key, required this.bannerEntity});

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
                  color: AppColors.surface.withValues(alpha: .12),
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
                      color: AppColors.surface.withValues(alpha: .18),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Icon(
                      Icons.edit_calendar_rounded,
                      color: AppColors.surface,
                      size: 18.sp,
                    ),
                  ),

                  SizedBox(height: 14.h),

                  //----------------------------------------
                  // Title
                  //----------------------------------------
                  Text(
                    bannerEntity.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.displaySmall.copyWith(fontSize: 22),
                  ),

                  SizedBox(height: 8.h),

                  //----------------------------------------
                  // Description
                  //----------------------------------------
                  Text(
                    bannerEntity.description,
                    style: AppTextStyles.labelMedium.copyWith(
                      height: 1.2,
                      fontSize: 14,
                    ),
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
                          bannerEntity.buttonText,
                          style: AppTextStyles.h2,
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
