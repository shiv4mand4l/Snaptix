import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../domain/entities/nearby_event_entities.dart';
import '../pages/widgets/near_you_event_card.dart';

class NearYouEventsSection extends StatelessWidget {
  final List<NearbyEventEntity> nearbyEventEntity;

  const NearYouEventsSection({super.key, required this.nearbyEventEntity});

  @override
  Widget build(BuildContext context) {
    if (nearbyEventEntity.isEmpty) {
      return const SizedBox.shrink();
    }

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
    final imageHeight = cardWidth / 1.8;

    final cardHeight = isLandscape && !isTablet
        ? imageHeight + 190.h
        : isTablet
        ? imageHeight + 200.h
        : isSmallPhone
        ? imageHeight + 185.h
        : imageHeight + 195.h;

    final horizontalPadding = isTablet ? 24.w : 16.w;

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
                'Events Near You',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.h4,
              ),
            ),

            SizedBox(width: isSmallPhone ? 10.w : 16.w),

            Flexible(
              flex: 2,
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 52.h,
                  maxWidth: isTablet ? 300.w : double.infinity,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallPhone ? 10.w : 14.w,
                  vertical: 7.h,
                ),
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
                      size: isSmallPhone ? 20.sp : 22.sp,
                    ),

                    SizedBox(width: 7.w),

                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
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

                    SizedBox(width: 5.w),

                    Icon(
                      Icons.tune_rounded,
                      color: AppColors.textSecondary,
                      size: isSmallPhone ? 18.sp : 20.sp,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 12.h),

        // --------------------------------------------------
        // HORIZONTAL EVENTS
        // --------------------------------------------------
        SizedBox(
          height: cardHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 6.h,
            ),
            itemCount: nearbyEventEntity.length,
            separatorBuilder: (_, _) => SizedBox(width: 14.w),
            itemBuilder: (context, index) {
              return SizedBox(
                width: cardWidth,
                height: cardHeight,
                child: NearYouEventCard(event: nearbyEventEntity[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
