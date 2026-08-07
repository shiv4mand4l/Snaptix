import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/routes/app_routes.dart';
import 'package:flutter_task/core/theme/app_theme.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import 'package:flutter_task/features/explore/domain/entities/event_entity.dart';

class AppCard extends StatelessWidget {
  final EventEntity eventEntity;
  const AppCard({super.key, required this.eventEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(28.r)),
      child: Stack(
        children: [
          //-----------------------------------
          // Background Image
          //-----------------------------------
          Positioned.fill(
            child: Image.asset(
              eventEntity.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) {
                return Container(
                  color: AppColors.disabled,
                  child: Icon(
                    Icons.image_not_supported,
                    size: 50.sp,
                    color: AppColors.textSecondary,
                  ),
                );
              },
            ),
          ),

          //-----------------------------------
          // Gradient Overlay
          //-----------------------------------
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.textPrimary.withValues(alpha: .30),
                    AppColors.textPrimary.withValues(alpha: .85),
                  ],
                  stops: const [0.30, 0.60, 1.0],
                ),
              ),
            ),
          ),

          //-----------------------------------
          // Content
          //-----------------------------------
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //-----------------------------------
                // Price
                //-----------------------------------
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.accentDark.withValues(alpha: .9),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      "\$${eventEntity.price}",
                      style: AppTextStyles.ticketPrice,
                    ),
                  ),
                ),

                const Spacer(),

                //-----------------------------------
                // Date
                //-----------------------------------
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: AppColors.divider,
                      size: 14.sp,
                    ),

                    SizedBox(width: 6.w),

                    Expanded(
                      child: Text(
                        "${eventEntity.date} • ${eventEntity.time}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.eventDate.copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 4.h),

                //-----------------------------------
                // Title
                //-----------------------------------
                Text(
                  eventEntity.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.eventTitle.copyWith(
                    fontSize: 22,
                    height: 1.2,
                  ),
                ),

                SizedBox(height: 8.h),

                //-----------------------------------
                // Location
                //-----------------------------------
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.divider,
                      size: 12.sp,
                    ),

                    SizedBox(width: 6.w),

                    Expanded(
                      child: Text(
                        eventEntity.location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.eventDate.copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 18.h),

                //-----------------------------------
                // Button
                //-----------------------------------
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
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
                          Text("Book Tickets", style: AppTextStyles.button),
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
