import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/theme/text_styles.dart';

import '../../data/models/booking_confirmation_model.dart';
import 'ticket_card_cliper.dart';
import 'ticket_cutout_divider.dart';

class TicketCard extends StatelessWidget {
  final BookingConfirmationModel bookingDetails;

  const TicketCard({super.key, required this.bookingDetails});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final cardWidth = screenWidth >= 600 ? 430.w : screenWidth - 32.w;

    final imageHeight = screenWidth < 340
        ? 155.h
        : screenWidth < 380
        ? 170.h
        : 180.h;

    final infoHeight = screenWidth < 340 ? 145.h : 155.h;

    final cutoutRadius = screenWidth < 340 ? 10.r : 12.r;

    final cutoutTop = imageHeight + infoHeight;

    return Center(
      child: SizedBox(
        width: cardWidth,
        child: Stack(
          children: [
            PhysicalShape(
              clipper: TicketCardClipper(
                cutoutTop: cutoutTop,
                cutoutRadius: cutoutRadius,
                borderRadius: 20.r,
              ),
              elevation: 7,
              shadowColor: AppColors.textPrimary.withValues(alpha: 0.06),
              color: AppColors.surface,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildEventHeader(imageHeight: imageHeight),

                  _buildEventInfo(height: infoHeight),

                  SizedBox(height: cutoutRadius * 2),

                  _buildQrSection(),
                ],
              ),
            ),

            Positioned(
              left: cutoutRadius,
              right: cutoutRadius,
              top: cutoutTop - 0.5.h,
              child: TicketCutoutDivider(
                height: 1.5.h,
                dashWidth: 6.w,
                dashSpace: 4.w,
                color: AppColors.divider,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // EVENT HEADER
  // ============================================================

  Widget _buildEventHeader({required double imageHeight}) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      child: SizedBox(
        height: imageHeight,
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(painter: HeaderBackgroundLinesPainter()),
            ),

            Positioned.fill(
              child: Image.asset(
                'assets/images/Indie Rock Concert.jpg',
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) {
                  return Container(color: AppColors.disabled);
                },
              ),
            ),

            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.textDark.withValues(alpha: 0.15),
                      AppColors.textDark.withValues(alpha: 0.75),
                    ],
                  ),
                ),
              ),
            ),

            // SUCCESS BADGE
            Positioned(
              top: 12.h,
              left: 12.w,
              right: 12.w,
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 145.w),
                  padding: EdgeInsets.all(7.r),
                  decoration: BoxDecoration(
                    color: AppColors.surface.withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(3.r),
                        decoration: const BoxDecoration(
                          color: AppColors.border,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check_circle,
                          color: AppColors.primary,
                          size: 14.sp,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Success!',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.extraSmallCaption,
                            ),
                            Text(
                              bookingDetails.eventName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.extraSmallCaption2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // BOTTOM EVENT INFO
            Positioned(
              left: 16.w,
              right: 16.w,
              bottom: 10.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.accentDark,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      bookingDetails.ticketType.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.labelExtraMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    bookingDetails.eventName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.eventTitle.copyWith(fontSize: 18.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // EVENT INFO
  // ============================================================

  Widget _buildEventInfo({required double height}) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _infoItem(
                    title: 'DATE',
                    value: bookingDetails.eventDate,
                  ),
                ),

                SizedBox(width: 12.w),

                Expanded(
                  child: _infoItem(
                    title: 'TIME',
                    value: bookingDetails.eventTime,
                  ),
                ),
              ],
            ),

            SizedBox(height: 12.h),

            Text('LOCATION', style: AppTextStyles.caption),

            SizedBox(height: 3.h),

            Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: AppColors.primary,
                  size: 14.sp,
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    bookingDetails.eventLocation,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.ticketNumber,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoItem({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.caption,
        ),
        SizedBox(height: 3.h),
        Text(
          value,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.liveEventDateConfirm,
        ),
      ],
    );
  }

  // ============================================================
  // QR SECTION
  // ============================================================

  Widget _buildQrSection() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 4.h, 20.w, 20.h),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: AppColors.border),
            ),
            child: Container(
              width: 150.w,
              height: 150.w,
              constraints: BoxConstraints(maxWidth: 160.w, maxHeight: 160.w),
              decoration: BoxDecoration(
                color: AppColors.textPrimary,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.qr_code_2_rounded,
                size: 105.sp,
                color: AppColors.surface,
              ),
            ),
          ),

          SizedBox(height: 12.h),

          Text(
            'Booking ID: #${bookingDetails.bookingId}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyles.labelSmall,
          ),

          SizedBox(height: 5.h),

          Text(
            '${bookingDetails.ticketCount} TICKETS • ADMIT ONE PER QR',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyExtraSmall,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// BACKGROUND PAINTER
// ============================================================

class HeaderBackgroundLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withValues(alpha: 0.15)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path();

    for (double i = -size.width; i < size.width * 2; i += 40) {
      path.moveTo(i, 0);
      path.lineTo(i + size.height, size.height);
    }

    canvas.drawPath(path, paint);

    final paintAccent = Paint()
      ..color = AppColors.info.withValues(alpha: 0.1)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final pathAccent = Path();

    pathAccent.moveTo(0, size.height * 0.7);

    pathAccent.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.3,
      size.width,
      size.height * 0.9,
    );

    canvas.drawPath(pathAccent, paintAccent);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
