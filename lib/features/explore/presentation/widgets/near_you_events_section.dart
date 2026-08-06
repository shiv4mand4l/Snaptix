import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';

import '../../../../core/theme/text_styles.dart';
import '../pages/widgets/notification_action_icon.dart';

class NearYouEventsSection extends StatelessWidget {
  const NearYouEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //-----------------------------------------
        // Header
        //-----------------------------------------
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                'Events Near You',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.h4,
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.textHint.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.primary,
                      size: 20.sp,
                    ),

                    SizedBox(width: 6.w),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'New York, NY',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.caption,
                          ),

                          Text(
                            'Within 10 mi',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.smallCaption,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 6.w),

                    Icon(
                      Icons.tune_rounded,
                      color: AppColors.textSecondary,
                      size: 20.sp,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 18.h),

        //-----------------------------------------
        // Horizontal Events
        //-----------------------------------------
        SizedBox(
          height: 0.38.sh,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 6.h),
            itemCount: 4,
            separatorBuilder: (_, _) => SizedBox(width: 16.w),
            itemBuilder: (_, index) {
              return SizedBox(
                width: screenWidth * 0.82,
                child: const NearYouEventCard(),
              );
            },
          ),
        ),
      ],
    );
  }
}
