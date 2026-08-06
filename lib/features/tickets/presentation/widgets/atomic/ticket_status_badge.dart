import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../ticket_status.dart';

class TicketStatusBadge extends StatelessWidget {
  final TicketStatus status;

  const TicketStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;

    switch (status) {
      case TicketStatus.liveSoon:
        color = AppColors.accentDark;
        text = 'LIVE SOON';
        break;
      case TicketStatus.confirmed:
        color = AppColors.primary;
        text = 'CONFIRMED';
        break;
      case TicketStatus.completed:
        color = AppColors.success;
        text = 'COMPLETED';
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(text, style: AppTextStyles.labelExtraMedium),
    );
  }
}
