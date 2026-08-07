import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import 'package:flutter_task/features/explore/domain/entities/nearby_event_entities.dart';

import '../../../../core/constants/app_colors.dart';
import '../pages/widgets/near_you_event_card.dart';

class NearYouEventsSection extends StatelessWidget {
  final List<NearbyEventEntity> nearbyEventEntity;

  const NearYouEventsSection({super.key, required this.nearbyEventEntity});

  @override
  Widget build(BuildContext context) {
    if (nearbyEventEntity.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --------------------------------------------------
        // HEADER
        // --------------------------------------------------
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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

            SizedBox(width: 30.w),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                      size: 24.sp,
                    ),

                    SizedBox(width: 8.w),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'New York, NY',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
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

        SizedBox(height: 14.h),

        // --------------------------------------------------
        // HORIZONTAL EVENTS
        // --------------------------------------------------
        SizedBox(
          height: 360.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 12.h),
            itemCount: nearbyEventEntity.length,
            separatorBuilder: (_, _) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              final event = nearbyEventEntity[index];

              return NearYouEventCard(event: event);
            },
          ),
        ),
      ],
    );
  }
}
