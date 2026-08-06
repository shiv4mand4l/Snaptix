import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

import '../../../../core/constants/app_colors.dart';

class EventInfoCard extends StatelessWidget {
  final String monthText;
  final String dayText;

  final String dateTitle;
  final String dateSubtitle;

  final String locationTitle;
  final String locationSubtitle;

  const EventInfoCard({
    super.key,
    required this.monthText,
    required this.dayText,
    required this.dateTitle,
    required this.dateSubtitle,
    required this.locationTitle,
    required this.locationSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.textDark.withValues(alpha: .08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 18.w),

          //-----------------------------------
          // Event Information
          //-----------------------------------
          Expanded(
            child: Column(
              children: [
                _InfoTile(
                  icon: Icons.calendar_today_outlined,
                  iconColor: AppColors.primary,
                  title: dateTitle,
                  subtitle: dateSubtitle,
                  color: AppColors.primary.withValues(alpha: .08),
                ),

                SizedBox(height: 24.w),

                // Divider(height: 28.h, color: Colors.grey.shade300),
                _InfoTile(
                  icon: Icons.location_on_outlined,
                  iconColor: AppColors.textPrimary,
                  title: locationTitle,
                  subtitle: locationSubtitle,
                  color: AppColors.textPrimary.withValues(alpha: .08),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final Color iconColor;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 46.h,
          width: 46.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(icon, color: iconColor, size: 24.sp),
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.h6),
              SizedBox(height: 4.h),
              Text(subtitle, style: AppTextStyles.caption),
            ],
          ),
        ),
      ],
    );
  }
}
