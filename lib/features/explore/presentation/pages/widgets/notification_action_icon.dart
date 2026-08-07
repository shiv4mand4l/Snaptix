import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';

class NotificationActionIcon extends StatelessWidget {
  const NotificationActionIcon({
    super.key,
    required this.onTap,
    this.showBadge = true,
    this.color,
  });

  final VoidCallback onTap;
  final bool showBadge;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          onPressed: onTap,
          splashRadius: 22.r,
          constraints: BoxConstraints(minWidth: 44.w, minHeight: 44.h),
          padding: EdgeInsets.all(8.r),
          icon: Icon(
            Icons.notifications_none_rounded,
            color: color,
            size: 24.sp,
          ),
        ),

        if (showBadge)
          Positioned(
            right: 10.w,
            top: 10.h,
            child: Container(
              width: 9.w,
              height: 9.w,
              decoration: const BoxDecoration(
                color: AppColors.error,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
