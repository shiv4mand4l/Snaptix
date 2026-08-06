import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMiniTicketCard extends StatelessWidget {
  final String badgeText;
  final String title;
  final String date;
  final String seat;
  final bool isActive;
  final VoidCallback? onTap;

  const ProfileMiniTicketCard({
    super.key,
    required this.badgeText,
    required this.title,
    required this.date,
    required this.seat,
    this.isActive = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final isSmall = screenWidth < 360;

    final isTablet = screenWidth >= 600;

    final cardWidth = isSmall
        ? 220.w
        : isTablet
        ? 300.w
        : 250.w;

    final horizontalPadding = isSmall
        ? 12.w
        : isTablet
        ? 18.w
        : 14.w;

    final bgColor = isActive
        ? const Color(0xFF5E17EB)
        : const Color(0xFFEFEFEF);

    final textColor = isActive ? Colors.white : const Color(0xFF191B28);

    final subTextColor = isActive ? Colors.white70 : const Color(0xFF828699);

    final badgeBgColor = isActive
        ? Colors.white.withValues(alpha: 0.2)
        : const Color(0xFFE2E4EB);

    final badgeTextColor = isActive ? Colors.white : const Color(0xFF828699);

    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: cardWidth,

        decoration: BoxDecoration(
          color: bgColor,

          borderRadius: BorderRadius.circular(isTablet ? 24.r : 20.r),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            // TOP SECTION
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,

                vertical: isSmall ? 10.h : 12.h,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      // Badge
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmall ? 8.w : 10.w,

                          vertical: isSmall ? 3.h : 4.h,
                        ),

                        decoration: BoxDecoration(
                          color: badgeBgColor,

                          borderRadius: BorderRadius.circular(12.r),
                        ),

                        child: Text(
                          badgeText.toUpperCase(),

                          style: TextStyle(
                            color: badgeTextColor,

                            fontSize: isSmall ? 8.sp : 9.sp,

                            fontWeight: FontWeight.bold,

                            letterSpacing: .5,
                          ),
                        ),
                      ),

                      // QR
                      if (isActive)
                        Container(
                          padding: EdgeInsets.all(5.r),

                          decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius: BorderRadius.circular(8.r),
                          ),

                          child: Icon(
                            Icons.qr_code_rounded,

                            color: const Color(0xFF5E17EB),

                            size: isTablet ? 20.sp : 16.sp,
                          ),
                        ),
                    ],
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    title,

                    maxLines: 2,

                    overflow: TextOverflow.ellipsis,

                    style: TextStyle(
                      color: textColor,

                      fontSize: isTablet ? 18.sp : 16.sp,

                      fontWeight: FontWeight.bold,

                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),

            // Divider
            Stack(
              alignment: Alignment.center,

              children: [
                Divider(
                  color: isActive ? Colors.white24 : const Color(0xFFE2E4EB),

                  height: 1.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    _cutout(right: true, isTablet: isTablet),

                    _cutout(right: false, isTablet: isTablet),
                  ],
                ),
              ],
            ),

            // Bottom Info
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,

                vertical: 10.h,
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  _infoItem("Date", date, textColor, subTextColor, false),

                  _infoItem("Seat", seat, textColor, subTextColor, true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cutout({required bool right, required bool isTablet}) {
    return Container(
      width: isTablet ? 10.w : 8.w,

      height: isTablet ? 18.h : 16.h,

      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFC),

        borderRadius: right
            ? BorderRadius.horizontal(right: Radius.circular(8.r))
            : BorderRadius.horizontal(left: Radius.circular(8.r)),
      ),
    );
  }

  Widget _infoItem(
    String label,
    String value,
    Color textColor,
    Color subTextColor,
    bool right,
  ) {
    return Column(
      crossAxisAlignment: right
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,

      children: [
        Text(
          label,

          style: TextStyle(color: subTextColor, fontSize: 10.sp),
        ),

        SizedBox(height: 2.h),

        Text(
          value,

          style: TextStyle(
            color: textColor,

            fontSize: 12.sp,

            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
