import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/onboarding/presentation/widgets/qr_code_container.dart';

class TicketBottomSection extends StatelessWidget {
  const TicketBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'A7-X29',
                  style: TextStyle(
                    color: const Color(0xFF151828),
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                    fontFamily: 'serif',
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Order #8921-00',
                  style: TextStyle(
                    color: const Color(0xFF8E94A3),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          const QrCodeContainer(),
        ],
      ),
    );
  }
}
