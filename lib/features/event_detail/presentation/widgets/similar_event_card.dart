import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/similar_event.dart';

class SimilarEventCard extends StatelessWidget {
  final SimilarEvent event;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const SimilarEventCard({
    super.key,
    required this.event,
    this.onTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --------------------------------------------------
            // IMAGE
            // --------------------------------------------------
            AspectRatio(
              aspectRatio: 1.5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    event.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) {
                      return Container(
                        color: AppColors.disabled,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.image,
                          size: 40.sp,
                          color: AppColors.textSecondary,
                        ),
                      );
                    },
                  ),

                  // FAVORITE
                  Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: onFavoriteTap,
                      child: CircleAvatar(
                        radius: 16.r,
                        backgroundColor: AppColors.surface.withValues(
                          alpha: 0.2,
                        ),
                        child: Icon(
                          event.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: event.isFavorite
                              ? AppColors.error
                              : AppColors.surface.withValues(alpha: 0.8),
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // --------------------------------------------------
            // INFO
            // --------------------------------------------------
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CATEGORY
                    Text(
                      event.category,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 5.h),

                    // TITLE
                    Text(
                      event.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.h5.copyWith(
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    // DATE + LOCATION
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 14.sp,
                          color: AppColors.textHint,
                        ),

                        SizedBox(width: 6.w),

                        Expanded(
                          child: Text(
                            event.dateAndLocation,
                            maxLines: 2,
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
      ),
    );
  }
}
