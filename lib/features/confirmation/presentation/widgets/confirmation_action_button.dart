import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class ConfirmationActionButtons extends StatelessWidget {
  final VoidCallback onViewTickets;
  final VoidCallback onAddToWallet;
  final VoidCallback onAddToCalendar;
  final VoidCallback onShareWithFriends;
  final VoidCallback onReturnToHome;

  const ConfirmationActionButtons({
    super.key,
    required this.onViewTickets,
    required this.onAddToWallet,
    required this.onAddToCalendar,
    required this.onShareWithFriends,
    required this.onReturnToHome,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isSmall = width < 360;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16.w : 24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Primary "View Tickets" CTA
          GestureDetector(
            onTap: onViewTickets,
            child: Container(
              height: isSmall ? 50.h : 54.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 12.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.confirmation_number_outlined,
                    color: Colors.white,
                    size: isSmall ? 18.sp : 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text('View Tickets', style: AppTextStyles.buttonTextThick),
                ],
              ),
            ),
          ),

          SizedBox(height: 12.h),

          // Add to Wallet & Calendar
          Row(
            children: [
              Expanded(
                child: _buildSecondaryButton(
                  context: context,
                  icon: Icons.wallet_outlined,
                  label: 'Add to Wallet',
                  onTap: onAddToWallet,
                ),
              ),
              SizedBox(width: isSmall ? 8.w : 12.w),
              Expanded(
                child: _buildSecondaryButton(
                  context: context,
                  icon: Icons.calendar_today_outlined,
                  label: 'Add to Calendar',
                  onTap: onAddToCalendar,
                ),
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // Share with Friends
          InkWell(
            onTap: onShareWithFriends,
            borderRadius: BorderRadius.circular(8.r),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.share_outlined,
                    color: const Color(0xFF6C3EE8),
                    size: isSmall ? 16.sp : 18.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Share with Friends',
                    style: AppTextStyles.buttonText.copyWith(
                      fontSize: isSmall ? 15.sp : 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 12.h),

          // Return Home
          InkWell(
            onTap: onReturnToHome,
            borderRadius: BorderRadius.circular(8.r),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: AppColors.textSecondary,
                    size: isSmall ? 16.sp : 18.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Return to Home',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: isSmall ? 13.sp : 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondaryButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final width = MediaQuery.sizeOf(context).width;
    final isSmall = width < 360;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: isSmall ? 44.h : 48.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color(0xFF1E293B),
              size: isSmall ? 16.sp : 18.sp,
            ),
            SizedBox(width: 6.w),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: isSmall ? 11.5.sp : 12.5.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1E293B),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
