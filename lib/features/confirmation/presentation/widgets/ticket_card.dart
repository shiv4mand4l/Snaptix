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
    // Dynamic values for responsiveness and clipping coordinates
    final double cardWidth = 327.w;
    // We position the cutout dynamically so layout doesn't break
    final double cutoutTop = 310.h;
    final double cutoutRadius = 12.r;

    return Center(
      child: Stack(
        children: [
          // Shadow and Background via PhysicalShape
          PhysicalShape(
            clipper: TicketCardClipper(
              cutoutTop: cutoutTop,
              cutoutRadius: cutoutRadius,
              borderRadius: 20.r,
            ),
            elevation: 8.0,
            shadowColor: AppColors.textPrimary.withValues(alpha: 0.04),
            color: AppColors.surface,
            child: SizedBox(
              width: cardWidth,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 1. Hero Event Image
                  _buildEventHeader(),

                  // 2. Event Date, Time, Location Info
                  _buildEventInfo(),

                  // 3. Spacing for cutout divider
                  SizedBox(height: cutoutRadius * 2),

                  // 4. QR and ID Section
                  _buildQrSection(),
                ],
              ),
            ),
          ),

          // Dashed Cutout Line Overlay (Positioned exactly at the cutout center)
          Positioned(
            left: cutoutRadius,
            right: cutoutRadius,
            top: cutoutTop - 0.5.h, // Centered horizontally
            child: TicketCutoutDivider(
              height: 1.5.h,
              dashWidth: 6.w,
              dashSpace: 4.w,
              color: AppColors.divider,
            ),
          ),
        ],
      ),
    );
  }

  // --- Header Image overlay widget ---
  Widget _buildEventHeader() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      child: Container(
        height: 180.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.textPrimary.withValues(alpha: 0.4),
              AppColors.textDark.withValues(alpha: .02),
              AppColors.textPrimary.withValues(alpha: 0.4),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Decorative background patterns mimicking neon festival light lines
            Positioned.fill(
              child: CustomPaint(painter: HeaderBackgroundLinesPainter()),
            ),

            // Actual premium network image for realism
            Positioned.fill(
              child: Image.asset(
                'assets/images/Party Pop.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Muted fallback showing glowing gradients
                  return Container();
                },
                // loadingBuilder: (context, child, loadingProgress) {
                //   if (loadingProgress == null) return child;
                //   return const Center(child: AppLoader());
                // },
              ),
            ),

            // Muted overlay for better text contrast
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.textDark.withValues(alpha: 0.2),
                    AppColors.textDark.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),

            // Mini Success Thumbnail Card (Top-Left)
            Positioned(
              top: 12.h,
              left: 12.w,
              child: Container(
                width: 140.w,
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.surface.withValues(alpha: 0.85),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: AppColors.surface.withValues(alpha: 0.5),
                    width: 1.w,
                  ),
                ),
                child: Row(
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Success!',
                            style: AppTextStyles.extraSmallCaption,
                          ),
                          Text(
                            'Neon Pulse 2024',
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

            // Bottom Labels (Badge and Title)
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
                      style: AppTextStyles.labelExtraMedium.copyWith(
                        fontWeight: .bold,
                      ),
                    ),
                  ),
                  // SizedBox(height: 6.h),
                  Text(
                    bookingDetails.eventName,
                    style: AppTextStyles.eventTitle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Middle Info Section ---
  Widget _buildEventInfo() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('DATE', style: AppTextStyles.caption),
                    SizedBox(height: 4.h),
                    Text(
                      bookingDetails.eventDate,
                      style: AppTextStyles.liveEventDateConfirm,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              // Time
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('TIME', style: AppTextStyles.caption),
                    SizedBox(height: 4.h),
                    Text(
                      bookingDetails.eventTime,
                      style: AppTextStyles.liveEventDateConfirm,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          // Location
          Text('LOCATION', style: AppTextStyles.caption),
          SizedBox(height: 4.h),
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
                  style: AppTextStyles.ticketNumber,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- Bottom QR Section ---
  Widget _buildQrSection() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
      child: Column(
        children: [
          // QR Code Graphic Inside Card
          Column(
            children: [
              Container(
                padding: .all(20.r),
                decoration: BoxDecoration(
                  color: AppColors.textPrimary.withValues(alpha: 0.002),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.border),
                ),
                child: Container(
                  padding: EdgeInsets.all(30.r),
                  decoration: BoxDecoration(
                    color: AppColors.textPrimary,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Icon(
                    Icons.qr_code_scanner_outlined,
                    size: 100.sp,
                    color: AppColors.surface,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),
          // Booking ID
          Text(
            'Booking ID: #${bookingDetails.bookingId}',
            style: AppTextStyles.labelSmall,
          ),
          SizedBox(height: 6.h),
          // Ticket count and admit info
          Text(
            '${bookingDetails.ticketCount} TICKETS • ADMIT ONE PER QR',
            style: AppTextStyles.bodyExtraSmall,
          ),
        ],
      ),
    );
  }
}

// Custom Painter to draw cool glowing lines on the image fallback
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
      ..strokeWidth = 2.0
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
