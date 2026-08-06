import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketDatePill extends StatelessWidget {
  final String day;
  final String month;

  const TicketDatePill({super.key, required this.day, required this.month});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.15),
          width: 1.w,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            day,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              height: 1.1,
            ),
          ),
          Text(
            month.toUpperCase(),
            style: TextStyle(
              color: Colors.white70,
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
