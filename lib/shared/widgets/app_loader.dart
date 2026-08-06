import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';

class AppLoader extends StatefulWidget {
  const AppLoader({super.key});

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final horizontalPadding = screenWidth < 360 ? 16.w : 20.w;

    return AnimatedBuilder(
      animation: _shimmerController,

      builder: (context, child) {
        final opacity = 0.3 + (_shimmerController.value * 0.4);

        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),

          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 12.h,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // Search Bar Skeleton
              _skeletonBox(height: 52.h, radius: 16.r, opacity: opacity),

              SizedBox(height: 16.h),

              // Categories Skeleton
              SizedBox(
                height: 40.h,

                child: ListView.separated(
                  scrollDirection: Axis.horizontal,

                  itemCount: 4,

                  separatorBuilder: (_, _) => SizedBox(width: 10.w),

                  itemBuilder: (context, index) {
                    return _skeletonBox(
                      width: index == 0 ? 70.w : 90.w,

                      height: 40.h,

                      radius: 20.r,

                      opacity: opacity,
                    );
                  },
                ),
              ),

              SizedBox(height: 24.h),

              // Title Skeleton
              _skeletonBox(
                width: 140.w,

                height: 24.h,

                radius: 6.r,

                opacity: opacity,
              ),

              SizedBox(height: 16.h),

              // Trending Card Skeleton
              _skeletonBox(
                width: double.infinity,

                height: 340.h,

                radius: 28.r,

                opacity: opacity,
              ),

              SizedBox(height: 24.h),

              // Host Banner Skeleton
              _skeletonBox(
                width: double.infinity,

                height: 140.h,

                radius: 24.r,

                opacity: opacity,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _skeletonBox({
    double? width,

    required double height,

    required double opacity,

    required double radius,
  }) {
    return Container(
      width: width ?? double.infinity,

      height: height,

      decoration: BoxDecoration(
        color: AppColors.divider.withValues(alpha: opacity),

        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
