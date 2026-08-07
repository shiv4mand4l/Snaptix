import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

import '../../../../core/constants/app_colors.dart';

class TicketCardHeader extends StatelessWidget {
  const TicketCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200.h,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Network Image
              Image.asset(
                'assets/images/event discovery and booking.jpg',

                fit: BoxFit.cover,
                errorBuilder:
                    (
                      BuildContext context,
                      Object error,
                      StackTrace? stackTrace,
                    ) {
                      return Container(
                        color: AppColors.disabled,
                        child: const Icon(
                          Icons.image_not_supported_outlined,
                          color: AppColors.textDark,
                        ),
                      );
                    },
              ),

              // Gradient Overlay
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppColors.disabled,
                      Color(0xFF3A3D4E),
                      Color(0xFF1E202B),
                    ],
                    stops: [4.0, 3.5, 2.8, 1.0],
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    'EXCLUSIVE ACCESS',
                    style: AppTextStyles.labelExtraMedium,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  'Neon Horizon\nFestival 2024',
                  style: AppTextStyles.h3.copyWith(
                    color: AppColors.surface,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
