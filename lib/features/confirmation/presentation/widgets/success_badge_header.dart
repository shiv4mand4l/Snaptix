import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

class SuccessBadgeHeader extends StatelessWidget {
  final String eventName;
  final String subtitle;

  const SuccessBadgeHeader({
    super.key,
    required this.eventName,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isSmall = width < 360;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Success Badge
        Container(
          width: isSmall ? 72.w : 80.w,
          height: isSmall ? 72.w : 80.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.success,
            boxShadow: [
              BoxShadow(
                color: AppColors.success.withValues(alpha: 0.3),
                blurRadius: 16.r,
                spreadRadius: 2.r,
                offset: Offset(0, 6.h),
              ),
            ],
          ),
          child: Center(
            child: Icon(
              Icons.check_rounded,
              color: AppColors.surface,
              size: isSmall ? 44.sp : 50.sp,
            ),
          ),
        ),

        SizedBox(height: isSmall ? 20.h : 24.h),

        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            "You’re Going to $eventName!",
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.h4,
          ),
        ),

        SizedBox(height: 8.h),

        // Subtitle
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodySmall,
          ),
        ),
      ],
    );
  }
}
