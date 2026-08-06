import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/text_styles.dart';

class NearYouEventCard extends StatelessWidget {
  const NearYouEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.background.withValues(alpha: .95),
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.textPrimary.withValues(alpha: .08),
                blurRadius: 10.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //---------------------------------------------------
              // Image
              //---------------------------------------------------
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24.r),
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?q=80&w=800',
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) {
                          return Container(
                            color: Colors.grey.shade300,
                            child: Icon(Icons.image, size: 40.sp),
                          );
                        },
                      ),
                    ),
                  ),

                  Positioned(
                    top: 12.h,
                    right: 12.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .9),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text("\$25", style: AppTextStyles.labelSmall),
                    ),
                  ),
                ],
              ),

              //---------------------------------------------------
              // Details
              //---------------------------------------------------
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Brooklyn Food Expo",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.h5,
                      ),

                      SizedBox(height: 8.h),

                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: 16.sp,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 6.w),
                          Expanded(
                            child: Text(
                              "Today • 12:00 PM",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.labelSmall,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 8.h),

                      Row(
                        children: [
                          Icon(
                            Icons.near_me_outlined,
                            size: 16.sp,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 6.w),
                          Expanded(
                            child: Text(
                              "1.2 miles away",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.caption,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
