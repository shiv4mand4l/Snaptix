import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class BottomBookingBar extends StatelessWidget {
  final String price;
  final String unitText;
  final VoidCallback onBookTicketsTap;

  const BottomBookingBar({
    super.key,
    required this.price,
    this.unitText = "/ person",
    required this.onBookTicketsTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          boxShadow: [
            BoxShadow(
              color: AppColors.textDark.withValues(alpha: .08),
              blurRadius: 20.r,
              offset: Offset(0, -5.h),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            //--------------------------------------------------
            // Price
            //--------------------------------------------------
            Flexible(
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TICKET PRICE",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.labelSmall,
                  ),

                  SizedBox(height: 4.h),

                  FittedBox(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.scaleDown,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: price, style: AppTextStyles.h2),
                          TextSpan(
                            text: " $unitText",
                            style: AppTextStyles.eventLocation,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 14.w),

            //--------------------------------------------------
            // Button
            //--------------------------------------------------
            Expanded(
              flex: 4,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 52.h),
                child: ElevatedButton(
                  onPressed: onBookTicketsTap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "Book Now",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(width: 6.w),

                      Icon(Icons.arrow_forward, size: 20.sp),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
