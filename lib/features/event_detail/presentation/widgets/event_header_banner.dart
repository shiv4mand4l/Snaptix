import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';

class EventHeaderBanner extends StatelessWidget {
  final String imageUrl;
  final String bannerImageUrl;
  final String badgeText;
  final String title;
  final String dateTimeText;
  final bool isFavorite;

  final VoidCallback? onBackTap;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onShareTap;

  const EventHeaderBanner({
    super.key,
    required this.imageUrl,
    required this.badgeText,
    required this.title,
    required this.dateTimeText,
    required this.isFavorite,
    required this.bannerImageUrl,
    this.onBackTap,
    this.onFavoriteTap,
    this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380.h,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          //-----------------------------------
          // Banner Image
          //-----------------------------------
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            child: Image.asset(
              bannerImageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.accentDark.withValues(alpha: 0.7),
                  child: Icon(Icons.image_not_supported, size: 60.sp),
                );
              },
            ),
          ),

          //-----------------------------------
          // Gradient
          //-----------------------------------
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.textPrimary.withValues(alpha: .30),
                  Colors.transparent,
                  AppColors.textPrimary.withValues(alpha: .70),
                ],
              ),
            ),
          ),

          //-----------------------------------
          // Top Buttons
          //-----------------------------------
          Positioned(
            top: MediaQuery.of(context).padding.top + 12.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _CircleButton(
                  icon: Icons.arrow_back_ios_new,
                  onTap: onBackTap ?? () => context.pop(context),
                ),

                Row(
                  children: [
                    _CircleButton(
                      icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? AppColors.error : AppColors.surface,
                      onTap: onFavoriteTap,
                    ),

                    SizedBox(width: 10.w),

                    _CircleButton(
                      icon: Icons.share_outlined,
                      onTap: onShareTap,
                    ),
                  ],
                ),
              ],
            ),
          ),

          //-----------------------------------
          // Bottom Information
          //-----------------------------------
          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 60.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //-----------------------------------
                // Badge
                //-----------------------------------
                if (badgeText.isNotEmpty)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.accentDark,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      badgeText,
                      style: AppTextStyles.labelExtraMedium,
                    ),
                  ),

                // SizedBox(height: 12.h),

                //-----------------------------------
                // Title
                //-----------------------------------
                Text(
                  title,
                  style: AppTextStyles.h2.copyWith(color: AppColors.surface),
                ),

                // SizedBox(height: 10.h),

                //-----------------------------------
                // Date
                //-----------------------------------
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: AppColors.disabled,
                      size: 18,
                    ),

                    SizedBox(width: 8.w),

                    Expanded(
                      child: Text(dateTimeText, style: AppTextStyles.eventDate),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const _CircleButton({
    required this.icon,
    this.color = AppColors.surface,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.r),
      onTap: onTap,
      child: Container(
        height: 44.h,
        width: 44.w,
        decoration: BoxDecoration(
          color: AppColors.textDark.withValues(alpha: .35),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 22.sp),
      ),
    );
  }
}
