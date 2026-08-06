import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/app_theme.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import 'package:flutter_task/features/saved/domain/entities/saved_event_entities.dart';

import '../../../../core/constants/app_colors.dart';
import '../bloc/saved_event_bloc.dart';
import '../bloc/saved_event_event.dart';

class EventCardCompact extends StatelessWidget {
  final SavedEventEntity savedEventEntities;

  const EventCardCompact({super.key, required this.savedEventEntities});

  @override
  Widget build(BuildContext context) {
    final isFree = savedEventEntities.price == 0.0;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.textDark.withValues(alpha: 0.03),
            blurRadius: 12.r,
            offset: Offset(0, 6.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //--------------------------------------------------
          // Image
          //--------------------------------------------------
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
                child: Image.network(
                  savedEventEntities.imageUrl,
                  height: 180.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180.h,
                      color: AppColors.disabled,
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: AppColors.disabled,
                        size: 40.sp,
                      ),
                    );
                  },
                ),
              ),

              //--------------------------------------------------
              // Favorite Button
              //--------------------------------------------------
              Positioned(
                top: 12.h,
                right: 12.w,
                child: GestureDetector(
                  onTap: () {
                    context.read<SavedEventsBloc>().add(
                      ToggleSaveEvent(savedEventEntities.id),
                    );
                  },
                  child: Container(
                    width: 38.w,
                    height: 38.w,
                    decoration: BoxDecoration(
                      color: AppColors.surface.withValues(alpha: .85),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.textPrimary.withValues(alpha: .08),
                          blurRadius: 6.r,
                          offset: Offset(0, 2.h),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        savedEventEntities.isSaved
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: savedEventEntities.isSaved
                            ? AppColors.error
                            : AppColors.textSecondary,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          //--------------------------------------------------
          // Details
          //--------------------------------------------------
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //--------------------------------------------------
                // Title + Price
                //--------------------------------------------------
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        savedEventEntities.title,
                        // maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.h4,
                      ),
                    ),

                    SizedBox(width: 8.w),

                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          isFree
                              ? 'Free'
                              : '\$${savedEventEntities.price.toStringAsFixed(2)}',
                          style: AppTextStyles.buttonText,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                //--------------------------------------------------
                // Time
                //--------------------------------------------------
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: AppColors.textSecondary,
                      size: 16.sp,
                    ),
                    SizedBox(width: 6.w),
                    Expanded(
                      child: Text(
                        '${savedEventEntities.dates} • ${savedEventEntities.time}',
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 6.h),

                //--------------------------------------------------
                // Location
                //--------------------------------------------------
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.textSecondary,
                      size: 16.sp,
                    ),
                    SizedBox(width: 6.w),
                    Expanded(
                      child: Text(
                        savedEventEntities.location,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                //--------------------------------------------------
                // Button
                //--------------------------------------------------
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: AppTheme.lightTheme.outlinedButtonTheme.style,

                    child: Text(
                      'Quick Book',
                      style: AppTextStyles.buttonText.copyWith(fontSize: 15),
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
