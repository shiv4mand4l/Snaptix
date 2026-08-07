import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
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
                  style: AppTextStyles.bodyExtraSmall.copyWith(
                    fontSize: 26.sp,
                    letterSpacing: -0.5,
                  ),
                ),
                SizedBox(height: 4.h),
                Text('Order #8921-00', style: AppTextStyles.caption),
              ],
            ),
          ),

          const QrCodeContainer(),
        ],
      ),
    );
  }
}
