import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/routes/app_routes.dart';
import 'package:flutter_task/core/theme/app_theme.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import 'package:flutter_task/features/explore/domain/entities/nearby_event_entities.dart';
import 'package:go_router/go_router.dart';

class NearYouEventCard extends StatelessWidget {
  final NearbyEventEntity event;

  const NearYouEventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withValues(alpha: 0.08),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --------------------------------------------------
          // IMAGE + PRICE
          // --------------------------------------------------
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  event.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.disabled,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 40.sp,
                        color: AppColors.textSecondary,
                      ),
                    );
                  },
                ),
              ),

              // PRICE
              Positioned(
                top: 12.h,
                right: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surface.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    '\$${event.price.toStringAsFixed(2)}',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.textDark,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // --------------------------------------------------
          // DETAILS
          // --------------------------------------------------
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TITLE
                Text(
                  event.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.h5.copyWith(fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 8.h),

                // DATE + TIME
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
                        '${event.date} • ${event.time}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.caption,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8.h),

                // LOCATION
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
                        event.location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.caption,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 14.h),

                // BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 46.h,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(AppRoutes.eventDetail);
                    },
                    style: AppTheme.lightTheme.elevatedButtonTheme.style,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Book Tickets', style: AppTextStyles.button),
                          SizedBox(width: 8.w),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: AppColors.surface,
                            size: 16.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
