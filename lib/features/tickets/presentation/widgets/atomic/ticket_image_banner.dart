import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/text_styles.dart';
import '../ticket_status.dart';
import 'ticket_date_pill.dart';
import 'ticket_status_badge.dart';

class TicketImageBanner extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String day;
  final String month;
  final TicketStatus status;

  const TicketImageBanner({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.day,
    required this.month,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 8.5,
      child: Stack(
        children: [
          // Network Image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                // loadingBuilder: (context, child, loadingProgress) {
                //   if (loadingProgress == null) return child;
                //   return Container(
                //     color: AppColors.surface,
                //     child: AppLoader(),
                // );
                // },
                errorBuilder: (_, _, _) => Container(
                  color: AppColors.disabled,
                  child: Icon(
                    Icons.confirmation_number_outlined,
                    color: AppColors.textPrimary,
                    size: 32.sp,
                  ),
                ),
              ),
            ),
          ),

          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.textPrimary.withValues(alpha: .30),
                    AppColors.textPrimary.withValues(alpha: .85),
                  ],
                  stops: const [0.30, 0.60, 1.0],
                ),
              ),
            ),
          ),

          // Status Badge
          Positioned(
            top: 12.h,
            left: 12.w,
            child: TicketStatusBadge(status: status),
          ),

          // Date Pill
          Positioned(
            top: 12.h,
            right: 12.w,
            child: TicketDatePill(day: day, month: month),
          ),

          // Title Text
          Positioned(
            bottom: 12.h,
            left: 14.w,
            right: 14.w,
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.eventTitle.copyWith(
                fontSize: 22,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
