import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import 'package:flutter_task/shared/widgets/app_loader.dart';

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
              Image.network(
                'https://i.pinimg.com/736x/50/1b/28/501b2817c355831bff34d8f32779aadd.jpg',

                fit: BoxFit.cover,

                loadingBuilder:
                    (
                      BuildContext context,
                      Widget child,
                      ImageChunkEvent? loadingProgress,
                    ) {
                      if (loadingProgress == null) {
                        return child;
                      }

                      return const AppLoader();
                    },

                errorBuilder:
                    (
                      BuildContext context,
                      Object error,
                      StackTrace? stackTrace,
                    ) {
                      return Container(
                        color: Colors.grey.shade300,
                        child: const Icon(
                          Icons.image_not_supported_outlined,
                          color: Colors.grey,
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
                      Color(0xFF888B9E),
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
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.surface,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),

                SizedBox(height: 12.h),

                Text(
                  'Neon Horizon\nFestival 2024',
                  style: AppTextStyles.h2.copyWith(
                    color: AppColors.surface,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.15,
                    fontFamily: 'serif',
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
