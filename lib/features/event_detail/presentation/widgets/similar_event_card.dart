import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: SizedBox(
        width: 220.w,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.r),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //---------------------------------------
              // Image
              //---------------------------------------
              Expanded(
                flex: 6,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        event.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) {
                          return Container(
                            color: Colors.grey.shade300,
                            child: Icon(Icons.image, size: 40.sp),
                          );
                        },
                      ),
                    ),

                    Positioned(
                      top: 10.h,
                      right: 10.w,
                      child: GestureDetector(
                        onTap: onFavoriteTap,
                        child: CircleAvatar(
                          radius: 18.r,
                          backgroundColor: Colors.white,
                          child: Icon(
                            event.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: event.isFavorite ? Colors.red : Colors.grey,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //---------------------------------------
              // Info
              //---------------------------------------
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.category,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: 6.h),

                      Text(
                        event.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      const Spacer(),

                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 14.sp,
                            color: Colors.grey,
                          ),

                          SizedBox(width: 6.w),

                          Expanded(
                            child: Text(
                              event.dateAndLocation,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 12.sp,
                              ),
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
      ),
    );
  }
}
