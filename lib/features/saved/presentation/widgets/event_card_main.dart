import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../../domain/entities/saved_event_entities.dart';
import '../bloc/saved_event_bloc.dart';
import '../bloc/saved_event_event.dart';
import 'avatar_stack.dart';

class EventCardMain extends StatelessWidget {
  final SavedEventEntity event;

  const EventCardMain({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > 600;

        final imageHeight = isTablet ? 300.h : 240.h;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.textDark.withValues(alpha: .05),
                blurRadius: 16.r,
                offset: Offset(0, 8.h),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// IMAGE SECTION
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),

                child: SizedBox(
                  height: imageHeight,
                  width: double.infinity,

                  child: Stack(
                    fit: StackFit.expand,

                    children: [
                      Image.network(
                        event.imageUrl,

                        fit: BoxFit.cover,

                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColors.disabled,

                            child: Icon(
                              Icons.image_not_supported,
                              size: 50.sp,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),

                      /// Gradient
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,

                            colors: [
                              AppColors.textPrimary.withValues(alpha: 0.3),
                              Colors.transparent,
                              AppColors.textPrimary.withValues(alpha: 0.8),
                            ],
                          ),
                        ),
                      ),

                      /// Trending badge
                      Positioned(
                        left: 20.w,
                        top: 20.h,

                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 6.h,
                          ),

                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12.r),
                          ),

                          child: Row(
                            children: [
                              Icon(
                                Icons.hot_tub_outlined,
                                size: 12.sp,
                                color: AppColors.surface,
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                "TRENDING",
                                style: AppTextStyles.smallCaption.copyWith(
                                  color: AppColors.surface,
                                  fontWeight: FontWeight(600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// Favourite
                      Positioned(
                        right: 20.w,
                        top: 20.h,

                        child: InkWell(
                          borderRadius: BorderRadius.circular(50.r),

                          onTap: () {
                            context.read<SavedEventsBloc>().add(
                              ToggleSaveEvent(event.id),
                            );
                          },

                          child: Container(
                            width: 46.w,
                            height: 46.w,

                            decoration: BoxDecoration(
                              color: Colors.white24,

                              shape: BoxShape.circle,
                            ),

                            child: Icon(
                              event.isSaved
                                  ? Icons.favorite
                                  : Icons.favorite_border,

                              color: event.isSaved ? Colors.red : Colors.white,

                              size: 22.sp,
                            ),
                          ),
                        ),
                      ),

                      /// Bottom Information
                      Positioned(
                        left: 20.w,
                        right: 20.w,
                        bottom: 20.h,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              event.title,

                              maxLines: 2,

                              overflow: TextOverflow.ellipsis,

                              style: TextStyle(
                                color: AppColors.surface,

                                fontWeight: FontWeight.bold,

                                fontSize: isTablet ? 26.sp : 22.sp,
                              ),
                            ),

                            SizedBox(height: 12.h),

                            Wrap(
                              spacing: 15.w,

                              runSpacing: 8.h,

                              children: [
                                _InfoItem(
                                  icon: Icons.calendar_today,

                                  text: event.dates,
                                ),

                                _InfoItem(
                                  icon: Icons.location_on_outlined,

                                  text: event.location,
                                ),

                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14.w,

                                    vertical: 8.h,
                                  ),

                                  decoration: BoxDecoration(
                                    color: AppColors.accent,

                                    borderRadius: BorderRadius.circular(12.r),
                                  ),

                                  child: Text(
                                    "\$${event.price.toStringAsFixed(2)}",

                                    style: AppTextStyles.buttonText.copyWith(
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Bottom Action Section
              Padding(
                padding: EdgeInsets.all(20.r),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    AvatarStack(count: event.attendeesCount),

                    SizedBox(width: 12.w),

                    Flexible(
                      child: SizedBox(
                        height: 48.h,

                        child: ElevatedButton(
                          onPressed: () {
                            context.push(AppRoutes.eventDetail);
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,

                            foregroundColor: Colors.white,

                            padding: EdgeInsets.symmetric(
                              horizontal: isTablet ? 35.w : 24.w,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                          ),

                          child: FittedBox(
                            child: Text(
                              "Book Tickets",

                              style: TextStyle(
                                fontSize: 15.sp,

                                fontWeight: FontWeight.w700,
                              ),
                            ),
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
      },
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,

      crossAxisAlignment: .center,
      mainAxisAlignment: .spaceAround,
      children: [
        Icon(icon, color: AppColors.surface, size: 16.sp),

        SizedBox(width: 6.w),

        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 140.w),

          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,

            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.surface,
              // fontSize: 10.sp,
            ),
          ),
        ),
      ],
    );
  }
}
