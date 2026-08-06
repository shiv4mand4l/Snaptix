// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';

class AuthLogo extends StatelessWidget {
  final IconData logo;
  const AuthLogo({super.key, required this.logo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 90.w,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Icon(logo, color: AppColors.surface, size: 45.sp),
    );
  }
}
