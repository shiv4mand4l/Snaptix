import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

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
    final isTablet = width >= 600;

    final horizontalPadding = isSmall
        ? 4.w
        : isTablet
        ? 12.w
        : 4.w;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // --------------------------------------------------
          // VIEW TICKETS
          // --------------------------------------------------
          SizedBox(
            width: double.infinity,
            height: isSmall ? 50.h : 54.h,
            child: ElevatedButton(
              onPressed: onViewTickets,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.surface,
                elevation: 3,
                shadowColor: AppColors.primary.withValues(alpha: 0.25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.confirmation_number_outlined,
                    size: isSmall ? 18.sp : 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text('View Tickets', style: AppTextStyles.buttonTextThick),
                ],
              ),
            ),
          ),

          SizedBox(height: 12.h),

          // --------------------------------------------------
          // WALLET + CALENDAR
          // --------------------------------------------------
          Row(
            children: [
              Expanded(
                child: _buildSecondaryButton(
                  icon: Icons.wallet_outlined,
                  label: 'Add to Wallet',
                  onTap: onAddToWallet,
                  isSmall: isSmall,
                ),
              ),
              SizedBox(width: isSmall ? 8.w : 12.w),
              Expanded(
                child: _buildSecondaryButton(
                  icon: Icons.calendar_today_outlined,
                  label: 'Add to Calendar',
                  onTap: onAddToCalendar,
                  isSmall: isSmall,
                ),
              ),
            ],
          ),

          SizedBox(height: 18.h),

          // --------------------------------------------------
          // SHARE
          // --------------------------------------------------
          InkWell(
            onTap: onShareWithFriends,
            borderRadius: BorderRadius.circular(10.r),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.share_outlined,
                    color: AppColors.primary,
                    size: isSmall ? 17.sp : 18.sp,
                  ),
                  SizedBox(width: 7.w),
                  Text(
                    'Share with Friends',
                    style: AppTextStyles.buttonText.copyWith(
                      color: AppColors.primary,
                      fontSize: isSmall ? 14.sp : 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 4.h),

          // --------------------------------------------------
          // RETURN HOME
          // --------------------------------------------------
          InkWell(
            onTap: onReturnToHome,
            borderRadius: BorderRadius.circular(10.r),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: AppColors.textSecondary,
                    size: isSmall ? 17.sp : 18.sp,
                  ),
                  SizedBox(width: 7.w),
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
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required bool isSmall,
  }) {
    return SizedBox(
      height: isSmall ? 44.h : 48.h,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.textDark,
          padding: EdgeInsets.symmetric(horizontal: isSmall ? 6.w : 10.w),
          side: BorderSide(color: AppColors.border, width: 1.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: isSmall ? 16.sp : 18.sp,
              color: AppColors.textDark,
            ),
            SizedBox(width: 6.w),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: isSmall ? 11.sp : 12.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
