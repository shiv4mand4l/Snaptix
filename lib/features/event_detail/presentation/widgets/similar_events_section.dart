import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../domain/entities/similar_event.dart';
import 'similar_event_card.dart';

class SimilarEventsSection extends StatelessWidget {
  final List<SimilarEvent> events;

  final VoidCallback? onSeeAllTap;

  final ValueChanged<SimilarEvent>? onEventTap;

  final ValueChanged<SimilarEvent>? onFavoriteToggle;

  const SimilarEventsSection({
    super.key,
    required this.events,
    this.onSeeAllTap,
    this.onEventTap,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //------------------------------------------
        // Header
        //------------------------------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Similar Events",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.h3,
              ),
            ),

            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(70.w, 40.h),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: onSeeAllTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.01),
                      blurRadius: 10.r,
                      offset: Offset(0, 4.h),
                    ),
                  ],
                ),
                child: Text(
                  "See All",
                  style: AppTextStyles.buttonText.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 18.h),

        //------------------------------------------
        // Empty State
        //------------------------------------------
        if (events.isEmpty)
          SizedBox(
            height: 0.25.sh,
            child: Center(
              child: Text("No Similar Events", style: AppTextStyles.bodySmall),
            ),
          )
        else
          //------------------------------------------
          // Horizontal List
          //------------------------------------------
          SizedBox(
            height: 280.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              // ignore: deprecated_member_use
              cacheExtent: 300,
              itemCount: events.length,
              separatorBuilder: (_, _) => SizedBox(width: 16.w),
              itemBuilder: (_, index) {
                final event = events[index];

                return SimilarEventCard(
                  event: event,
                  onTap: () => onEventTap?.call(event),
                  onFavoriteTap: () => onFavoriteToggle?.call(event),
                );
              },
            ),
          ),
      ],
    );
  }
}
