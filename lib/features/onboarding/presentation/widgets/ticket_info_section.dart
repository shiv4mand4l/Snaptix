import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketInfoSection extends StatelessWidget {
  const TicketInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Row(
        children: [
          /// Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Section',
                  style: TextStyle(
                    color: const Color(0xFF8E94A3),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'VIP Floor',
                  style: TextStyle(
                    color: const Color(0xFF151828),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'serif',
                  ),
                ),
              ],
            ),
          ),

          /// Divider
          Container(width: 1.w, height: 36.h, color: const Color(0xFFE2E4EB)),

          SizedBox(width: 24.w),

          /// Entry Gate
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Entry Gate',
                  style: TextStyle(
                    color: const Color(0xFF8E94A3),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'West-04',
                  style: TextStyle(
                    color: const Color(0xFF151828),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'serif',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
