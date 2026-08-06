import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/routes/app_routes.dart';
import 'package:flutter_task/core/theme/app_theme.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import 'package:go_router/go_router.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key});

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
            child: Image.network(
              'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?q=80&w=800',
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) {
                return Container(
                  color: Colors.grey.shade300,
                  child: Icon(
                    Icons.image_not_supported,
                    size: 50.sp,
                    color: Colors.grey,
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
                    child: Text("\$89.00", style: AppTextStyles.ticketPrice),
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
                        "OCT 24, 2024 • 8:00 PM",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.eventDate,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8.h),

                //-----------------------------------
                // Title
                //-----------------------------------
                Text(
                  "Neon Snaptix: Underground Rave",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.eventTitle,
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
                      size: 14.sp,
                    ),

                    SizedBox(width: 6.w),

                    Expanded(
                      child: Text(
                        "The Warehouse District, NY",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.eventDate,
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
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      log("Book Ticket");
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
                            size: 18.sp,
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
