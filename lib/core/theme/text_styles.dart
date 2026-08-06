import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // ==========================
  // Display
  // ==========================

  static TextStyle displayLarge = GoogleFonts.spaceGrotesk(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    color: AppColors.textDark,
  );

  static TextStyle displayMedium = GoogleFonts.spaceGrotesk(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    color: AppColors.textDark,
  );

  static TextStyle displaySmall = GoogleFonts.spaceGrotesk(
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    color: AppColors.surface,
  );

  // ==========================
  // Headings
  // ==========================

  static TextStyle h1 = GoogleFonts.spaceGrotesk(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.4,
    color: AppColors.textDark,
  );

  static TextStyle h2 = GoogleFonts.spaceGrotesk(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3,
    color: AppColors.primary,
  );

  static TextStyle h3 = GoogleFonts.spaceGrotesk(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColors.textPrimary,
  );

  static TextStyle h4 = GoogleFonts.spaceGrotesk(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColors.textDark,
  );

  static TextStyle h5 = GoogleFonts.spaceGrotesk(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
  );

  static TextStyle h6 = GoogleFonts.spaceGrotesk(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  // ==========================
  // Body
  // ==========================

  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.surface,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );

  static TextStyle bodyExtraMedium = GoogleFonts.inter(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle bodyExtraSmall = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static TextStyle caption = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle smallCaption = GoogleFonts.inter(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle extraSmallCaption = GoogleFonts.inter(
    fontSize: 9.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
  );

  static TextStyle extraSmallCaption2 = GoogleFonts.inter(
    fontSize: 7.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
  );

  // ==========================
  // Labels
  // ==========================

  static TextStyle labelLarge = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
    color: AppColors.textDark,
  );

  static TextStyle labelMedium = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
    color: AppColors.divider.withValues(alpha: 0.7),
  );
  static TextStyle labelExtraMedium = GoogleFonts.inter(
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3,
    color: AppColors.surface,
  );

  static TextStyle labelSmall = GoogleFonts.inter(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.textSecondary,
  );
  static TextStyle labelExtraSmall = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: AppColors.primary,
  );

  // ==========================
  // Buttons
  // ==========================

  static TextStyle button = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: AppColors.surface,
  );
  static TextStyle buttonTicket = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w900,
    letterSpacing: 0.5,
    color: AppColors.surface,
  );
  static TextStyle buttonText = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: AppColors.primary,
  );

  static TextStyle buttonDark = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: AppColors.textDark,
  );
  static TextStyle buttonTextThick = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.5,
    color: AppColors.surface,
  );

  // ==========================
  // Event Card
  // ==========================

  static TextStyle eventTitle = GoogleFonts.spaceGrotesk(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.surface,
  );

  static TextStyle eventLocation = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static TextStyle eventDate = GoogleFonts.inter(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.divider,
  );

  static TextStyle liveEventDate = GoogleFonts.inter(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );
  static TextStyle liveEventDateConfirm = GoogleFonts.inter(
    fontSize: 13.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.textDark,
  );

  static TextStyle eventPrice = GoogleFonts.inter(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );

  // ==========================
  // Splash
  // ==========================

  static TextStyle splashTitle = GoogleFonts.spaceGrotesk(
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.8,
    color: AppColors.surface,
  );

  static TextStyle splashSubtitle = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
    color: AppColors.surface.withValues(alpha: 0.7),
  );

  static TextStyle splashLoadingText = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.surface.withValues(alpha: 0.7),
  );

  // ==========================
  // Tickets
  // ==========================

  static TextStyle ticketTitle = GoogleFonts.spaceGrotesk(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  static TextStyle ticketNumber = GoogleFonts.inter(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
    color: AppColors.textDark,
  );

  static TextStyle ticketPrice = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.surface,
  );

  // ==========================
  // Nepali
  // ==========================

  static TextStyle nepali = GoogleFonts.notoSansDevanagari(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
  );
}
