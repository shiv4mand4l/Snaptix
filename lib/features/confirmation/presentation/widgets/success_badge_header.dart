import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

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

    final isVerySmall = width < 340;
    final isSmall = width < 380;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: isVerySmall ? 68.w : 76.w,
          height: isVerySmall ? 68.w : 76.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.success,
            boxShadow: [
              BoxShadow(
                color: AppColors.success.withValues(alpha: 0.25),
                blurRadius: 14.r,
                spreadRadius: 1.r,
                offset: Offset(0, 5.h),
              ),
            ],
          ),
          child: Center(
            child: Icon(
              Icons.check_rounded,
              color: AppColors.surface,
              size: isVerySmall ? 40.sp : 46.sp,
            ),
          ),
        ),

        SizedBox(height: isSmall ? 16.h : 20.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            "You're Going to $eventName!",
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.h4.copyWith(
              fontSize: isVerySmall ? 20.sp : 22.sp,
            ),
          ),
        ),

        SizedBox(height: 6.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodySmall.copyWith(
              fontSize: isVerySmall ? 12.sp : 13.sp,
            ),
          ),
        ),
      ],
    );
  }
}
