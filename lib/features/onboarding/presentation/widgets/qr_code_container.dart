import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class QrCodeContainer extends StatelessWidget {
  const QrCodeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.w,
      height: 72.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.divider,
        borderRadius: BorderRadius.circular(18.r),
      ),

      child: Icon(
        Icons.qr_code_scanner_rounded,
        size: 40.sp,
        color: AppColors.primary,
      ),
    );
  }
}
