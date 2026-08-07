import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/app_theme.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

import '../../../../core/constants/app_colors.dart';

class OrganizerInfoCard extends StatelessWidget {
  final String logoUrl;
  final String name;
  final double rating;
  final String reviewsCount;

  final bool isFollowing;

  final VoidCallback onFollowTap;

  const OrganizerInfoCard({
    super.key,
    required this.logoUrl,
    required this.name,
    required this.rating,
    required this.reviewsCount,
    required this.isFollowing,
    required this.onFollowTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //-----------------------------------------
        // Title
        //-----------------------------------------
        Text("Organizer", style: AppTextStyles.h3),

        SizedBox(height: 16.h),

        //-----------------------------------------
        // Card
        //-----------------------------------------
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(18.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.textDark.withValues(alpha: .06),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  logoUrl,
                  width: 64.w,
                  height: 64.w,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) {
                    return Container(
                      width: 64.w,
                      height: 64.w,
                      color: AppColors.disabled,
                      child: Icon(Icons.person, size: 32.sp),
                    );
                  },
                ),
              ),

              SizedBox(width: 14.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18.sp),

                        SizedBox(width: 4.w),

                        Text(
                          rating.toStringAsFixed(1),
                          style: AppTextStyles.labelSmall,
                        ),

                        SizedBox(width: 6.w),

                        Expanded(
                          child: Text(
                            "$reviewsCount Reviews",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppTextStyles.caption,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(width: 12.w),

              ElevatedButton(
                onPressed: onFollowTap,
                style: AppTheme.lightTheme.elevatedButtonTheme.style?.copyWith(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  ),
                  minimumSize: WidgetStatePropertyAll(Size(0, 40.h)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: WidgetStatePropertyAll(
                    isFollowing
                        ? AppColors.textHint.withValues(alpha: 0.9)
                        : AppColors.primary,
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                ),
                child: Text(
                  isFollowing ? "Following" : "Follow",
                  style: AppTextStyles.caption.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.surface,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
