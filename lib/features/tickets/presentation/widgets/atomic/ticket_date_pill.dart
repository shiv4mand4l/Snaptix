import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

class TicketDatePill extends StatelessWidget {
  final String day;
  final String month;

  const TicketDatePill({super.key, required this.day, required this.month});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.textPrimary.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: AppColors.surface.withValues(alpha: 0.15),
          width: 1.w,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            day,
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.surface,
              height: 1.1,
            ),
          ),
          Text(
            month.toUpperCase(),
            style: AppTextStyles.caption.copyWith(
              color: AppColors.disabled,
              fontSize: 8.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
