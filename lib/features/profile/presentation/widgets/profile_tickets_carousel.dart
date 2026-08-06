import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

import 'profile_mini_ticket_card.dart';

class ProfileTicketsCarousel extends StatelessWidget {
  final VoidCallback? onViewAllTap;

  const ProfileTicketsCarousel({super.key, this.onViewAllTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final isSmall = width < 360;
    final isTablet = width >= 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(
              'My Tickets',

              style: AppTextStyles.h3.copyWith(
                fontSize: isTablet ? 22.sp : 18.sp,
              ),
            ),

            GestureDetector(
              onTap: onViewAllTap,

              child: Text(
                'VIEW ALL',

                style: AppTextStyles.bodyExtraSmall.copyWith(
                  fontSize: isSmall
                      ? 10.sp
                      : isTablet
                      ? 14.sp
                      : 12.sp,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: isSmall ? 10.h : 14.h),

        // Ticket Carousel
        SizedBox(
          height: isSmall
              ? 180.h
              : isTablet
              ? 230.h
              : 200.h,

          child: ListView.separated(
            scrollDirection: Axis.horizontal,

            physics: const BouncingScrollPhysics(),

            itemCount: 5,

            separatorBuilder: (_, _) => SizedBox(width: isTablet ? 18.w : 14.w),

            itemBuilder: (context, index) {
              return ProfileMiniTicketCard(
                badgeText: index.isEven ? 'COMING UP' : 'COMPLETED',

                title: index.isEven
                    ? 'Neon Nights\nFestival'
                    : 'Summer Jazz\nSessions',

                date: index.isEven ? 'Oct 24, 2024' : 'Aug 12, 2024',

                seat: index.isEven ? 'GA-402' : 'VIP-102',

                isActive: index.isEven,
              );
            },
          ),
        ),
      ],
    );
  }
}
