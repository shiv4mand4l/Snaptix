import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback? onTap;

  const LogoutButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return GestureDetector(
      onTap: onTap,

      child: Padding(
        padding: EdgeInsets.symmetric(vertical: width < 360 ? 10.h : 12.h),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(
              Icons.logout_rounded,
              color: const Color(0xFFFF4D4D),
              size: width < 360 ? 18.sp : 20.sp,
            ),

            SizedBox(width: 8.w),

            Text(
              'Logout',
              style: AppTextStyles.bodyLarge.copyWith(
                fontSize: width < 360 ? 14.sp : 16.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFF4D4D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
