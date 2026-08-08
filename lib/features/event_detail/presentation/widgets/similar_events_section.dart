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
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = screenWidth >= 600;
    final isSmallPhone = screenWidth < 360;
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    // --------------------------------------------------
    // RESPONSIVE CARD WIDTH
    // --------------------------------------------------
    final double cardWidth;

    if (isLandscape && !isTablet) {
      cardWidth = screenWidth * 0.55;
    } else if (isTablet) {
      cardWidth = screenWidth * 0.45;
    } else {
      cardWidth = screenWidth * 0.75;
    }

    // --------------------------------------------------
    // RESPONSIVE CARD HEIGHT
    // --------------------------------------------------
    final imageHeight = cardWidth / 1.5;

    final listHeight = isLandscape && !isTablet
        ? imageHeight + 125.h
        : isTablet
        ? imageHeight + 145.h
        : isSmallPhone
        ? imageHeight + 135.h
        : imageHeight + 140.h;

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
              child: Text(
                'Similar Events',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.h3,
              ),
            ),

            SizedBox(width: 8.w),

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
                ),
                child: Text(
                  'See All',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.buttonText.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 14.h),

        // --------------------------------------------------
        // EMPTY STATE
        // --------------------------------------------------
        if (events.isEmpty)
          SizedBox(
            height: 0.25.sh,
            child: Center(
              child: Text('No Similar Events', style: AppTextStyles.bodySmall),
            ),
          )
        else
          // --------------------------------------------------
          // HORIZONTAL LIST
          // --------------------------------------------------
          SizedBox(
            height: listHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              itemCount: events.length,
              separatorBuilder: (_, _) => SizedBox(width: 14.w),
              itemBuilder: (_, index) {
                final event = events[index];

                return SizedBox(
                  width: cardWidth,
                  height: listHeight,
                  child: SimilarEventCard(
                    event: event,
                    onTap: () => onEventTap?.call(event),
                    onFavoriteTap: () => onFavoriteToggle?.call(event),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
