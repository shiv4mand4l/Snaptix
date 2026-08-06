import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';

class AppBarAction extends StatelessWidget {
  const AppBarAction({
    super.key,
    required this.icon,
    required this.onTap,
    this.color = AppColors.primary,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      splashRadius: 22.r,
      constraints: BoxConstraints(minWidth: 44.w, minHeight: 44.h),
      padding: EdgeInsets.all(8.r),
      icon: Icon(icon, color: color, size: 24.sp),
    );
  }
}
