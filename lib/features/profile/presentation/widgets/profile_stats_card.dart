import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class ProfileStatsCard extends StatelessWidget {
  final String activeEventsText;
  final String rewardPointsText;

  const ProfileStatsCard({
    super.key,
    required this.activeEventsText,
    required this.rewardPointsText,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final isSmall = width < 360;
    final isTablet = width >= 600;

    return Row(
      children: [
        Expanded(
          child: _buildStatItem(
            label: 'Upcoming Events',
            value: activeEventsText,
            valueColor: AppColors.primary,
            isSmall: isSmall,
            isTablet: isTablet,
          ),
        ),

        SizedBox(width: isTablet ? 20.w : 14.w),

        Expanded(
          child: _buildStatItem(
            label: 'Reward Points',
            value: rewardPointsText,
            valueColor: AppColors.error,
            isSmall: isSmall,
            isTablet: isTablet,
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem({
    required String label,
    required String value,
    required Color valueColor,
    required bool isSmall,
    required bool isTablet,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall
            ? 12.w
            : isTablet
            ? 24.w
            : 16.w,

        vertical: isTablet ? 20.h : 16.h,
      ),

      decoration: BoxDecoration(
        color: AppColors.info.withValues(alpha: 0.06),

        borderRadius: BorderRadius.circular(isTablet ? 24.r : 20.r),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            label,

            maxLines: 1,

            overflow: TextOverflow.ellipsis,

            style: AppTextStyles.caption.copyWith(
              fontSize: isTablet ? 14.sp : 12.sp,
            ),
          ),

          SizedBox(height: 8.h),

          Text(
            value,

            style: AppTextStyles.bodyExtraMedium.copyWith(
              fontSize: isSmall
                  ? 16.sp
                  : isTablet
                  ? 22.sp
                  : 18.sp,

              fontWeight: FontWeight.bold,

              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
