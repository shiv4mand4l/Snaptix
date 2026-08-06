import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketCardHeader extends StatelessWidget {
  const TicketCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFEBEBFA),
                Color(0xFF888B9E),
                Color(0xFF3A3D4E),
                Color(0xFF1E202B),
              ],
              stops: [0.0, 0.5, 0.8, 1.0],
            ),
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
                    color: const Color(0xFF3B41D8),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    'EXCLUSIVE ACCESS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),

                SizedBox(height: 12.h),

                Text(
                  'Neon Horizon\nFestival 2024',
                  style: TextStyle(
                    color: Colors.white,
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
