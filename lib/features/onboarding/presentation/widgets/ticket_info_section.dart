import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

class TicketInfoSection extends StatelessWidget {
  const TicketInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Row(
        children: [
          /// Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Section',
                  style: AppTextStyles.caption.copyWith(
                    color: const Color(0xFF8E94A3),
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text('VIP Floor', style: AppTextStyles.h4),
              ],
            ),
          ),

          /// Divider
          Container(width: 1.w, height: 36.h, color: AppColors.disabled),

          SizedBox(width: 24.w),

          /// Entry Gate
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Entry Gate',
                  style: AppTextStyles.caption.copyWith(
                    color: const Color(0xFF8E94A3),
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text('West-04', style: AppTextStyles.h4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
