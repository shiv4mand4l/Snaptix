import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/features/tickets/domain/entities/ticket_entities.dart';

import 'atomic/ticket_action_button.dart';
import 'atomic/ticket_dashed_divider.dart';
import 'atomic/ticket_detail_tile.dart';
import 'atomic/ticket_id_badge.dart';
import 'atomic/ticket_image_banner.dart';

class TicketCard extends StatelessWidget {
  final TicketEntities ticket;
  final VoidCallback? onViewTicketTap;
  final VoidCallback? onCardTap;

  const TicketCard({
    super.key,
    required this.ticket,
    this.onViewTicketTap,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.textPrimary.withValues(alpha: 0.1),
              blurRadius: 16.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. Top Image Banner
            TicketImageBanner(
              imageUrl: ticket.imageUrl,
              title: ticket.title,
              day: ticket.dateDay,
              month: ticket.dateMonth,
              status: ticket.status,
            ),

            // 2. Middle Event Details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  Expanded(
                    child: TicketDetailTile(
                      icon: Icons.calendar_today_rounded,
                      label: 'DATE & TIME',
                      value: ticket.dateTimeString,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TicketDetailTile(
                      icon: Icons.location_on_rounded,
                      label: 'VENUE',
                      value: ticket.venue,
                    ),
                  ),
                ],
              ),
            ),

            // 3. Dashed Tear-Off Line
            const TicketDashedDivider(),

            // 4. Bottom Section (Ticket ID & View Ticket Button)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: TicketIdBadge(ticketId: ticket.ticketId)),
                  SizedBox(width: 12.w),
                  TicketActionButton(
                    text: 'VIEW TICKET',
                    onTap: onViewTicketTap,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
