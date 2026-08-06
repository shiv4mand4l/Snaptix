import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

import '../../../../../core/constants/app_colors.dart';

class TicketIdBadge extends StatelessWidget {
  final String ticketId;

  const TicketIdBadge({super.key, required this.ticketId});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36.w,
          height: 36.h,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(
            Icons.qr_code_scanner,
            color: AppColors.textPrimary,
            size: 20.sp,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Ticket ID:', style: AppTextStyles.smallCaption),
              Text(
                ticketId,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.liveEventDate,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
