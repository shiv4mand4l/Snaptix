import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

class UserProfileHeader extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final String location;
  final VoidCallback? onEditAvatarTap;

  const UserProfileHeader({
    super.key,
    required this.avatarUrl,
    required this.userName,
    required this.location,
    this.onEditAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final isSmall = width < 360;
    final isTablet = width >= 600;

    final avatarRadius = isSmall
        ? 38.r
        : isTablet
        ? 60.r
        : 46.r;

    return Column(
      children: [
        // Avatar + Edit Button
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                boxShadow: [
                  BoxShadow(
                    color: AppColors.textPrimary.withValues(alpha: 0.08),

                    blurRadius: isTablet ? 28.r : 20.r,

                    offset: Offset(0, 8.h),
                  ),
                ],
              ),

              child: CircleAvatar(
                radius: avatarRadius,

                backgroundColor: AppColors.background,

                backgroundImage: AssetImage(avatarUrl),
              ),
            ),

            // Edit Badge
            Positioned(
              right: 0,

              bottom: 0,

              child: GestureDetector(
                onTap: onEditAvatarTap,

                child: Container(
                  padding: EdgeInsets.all(
                    isSmall
                        ? 5.r
                        : isTablet
                        ? 9.r
                        : 7.r,
                  ),

                  decoration: BoxDecoration(
                    color: AppColors.primary,

                    shape: BoxShape.circle,

                    border: Border.all(
                      color: AppColors.surface,

                      width: isTablet ? 3.w : 2.5.w,
                    ),
                  ),

                  child: Icon(
                    Icons.edit,

                    color: AppColors.surface,

                    size: isSmall
                        ? 11.sp
                        : isTablet
                        ? 16.sp
                        : 13.sp,
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: isSmall ? 10.h : 14.h),

        // User Name
        Text(
          userName,

          maxLines: 1,

          overflow: TextOverflow.ellipsis,

          style: AppTextStyles.h1.copyWith(
            fontSize: isSmall
                ? 22.sp
                : isTablet
                ? 30.sp
                : null,
          ),
        ),

        SizedBox(height: 4.h),

        // Location
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(
              Icons.location_on_outlined,

              color: AppColors.textHint,

              size: isSmall
                  ? 16.sp
                  : isTablet
                  ? 22.sp
                  : 18.sp,
            ),

            SizedBox(width: 3.w),

            Flexible(
              child: Text(
                location,

                maxLines: 1,

                overflow: TextOverflow.ellipsis,

                style: AppTextStyles.caption.copyWith(
                  fontSize: isTablet ? 16.sp : null,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
