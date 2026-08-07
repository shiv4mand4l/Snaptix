import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/onboarding/presentation/widgets/painters/dashed_line_painter.dart';

import '../../../../core/constants/app_colors.dart';
import 'ticket_bottom_section.dart';
import 'ticket_header.dart';
import 'ticket_info_section.dart';

class TicketCardContent extends StatelessWidget {
  const TicketCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28.r),
      child: Container(
        width: double.infinity,
        color: AppColors.background,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Header
            const TicketCardHeader(),

            /// Section & Gate
            const TicketInfoSection(),

            // / Dashed Divider
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                width: double.infinity,
                height: 1.h,
                child: CustomPaint(
                  painter: DashedLinePainter(color: AppColors.disabled),
                ),
              ),
            ),

            /// Ticket Code + QR
            const TicketBottomSection(),
          ],
        ),
      ),
    );
  }
}
