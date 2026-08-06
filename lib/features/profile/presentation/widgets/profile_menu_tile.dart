import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

class ProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconBgColor;
  final Color iconColor;
  final VoidCallback? onTap;

  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.iconBgColor,
    required this.iconColor,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final isSmallDevice = screenWidth < 360;
    final isTablet = screenWidth >= 600;

    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(16.r),

      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isSmallDevice
              ? 12.w
              : isTablet
              ? 24.w
              : 16.w,

          vertical: isSmallDevice
              ? 10.h
              : isTablet
              ? 18.h
              : 14.h,
        ),

        child: Row(
          children: [
            // Icon Container
            Container(
              padding: EdgeInsets.all(
                isSmallDevice
                    ? 8.r
                    : isTablet
                    ? 12.r
                    : 10.r,
              ),

              decoration: BoxDecoration(
                color: iconBgColor,

                borderRadius: BorderRadius.circular(12.r),
              ),

              child: Icon(
                icon,

                color: iconColor,

                size: isSmallDevice
                    ? 18.sp
                    : isTablet
                    ? 24.sp
                    : 20.sp,
              ),
            ),

            SizedBox(width: isTablet ? 20.w : 16.w),

            // Title
            Expanded(
              child: Text(
                title,

                maxLines: 1,

                overflow: TextOverflow.ellipsis,

                style: AppTextStyles.labelLarge.copyWith(
                  fontSize: isTablet ? 18.sp : null,
                ),
              ),
            ),

            // Chevron Arrow
            Icon(
              Icons.chevron_right_rounded,

              color: AppColors.disabled,

              size: isTablet ? 24.sp : 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}
