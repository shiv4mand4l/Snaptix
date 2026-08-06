import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      scaffoldBackgroundColor: AppColors.background,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surface,
        error: AppColors.error,
      ),

      fontFamily: GoogleFonts.inter().fontFamily,

      //-------------------------------------------------
      // AppBar
      //-------------------------------------------------
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textDark,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 56.h,
      ),

      //-------------------------------------------------
      // Elevated Button
      //-------------------------------------------------
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, 52.h),
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
      ),

      //-------------------------------------------------
      // Outlined Button
      //-------------------------------------------------
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.primary,
          minimumSize: Size(double.infinity, 52.h),
          padding: EdgeInsets.symmetric(vertical: 14.h),

          side: BorderSide(color: AppColors.primary, width: 1.w),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
      ),

      //-------------------------------------------------
      // Input Fields
      //-------------------------------------------------
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,

        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: AppColors.border, width: 1.w),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: AppColors.border, width: 1.w),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: AppColors.primary, width: 2.w),
        ),
      ),

      //-------------------------------------------------
      // Cards
      //-------------------------------------------------
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),

      //-------------------------------------------------
      // Text Theme
      //-------------------------------------------------
      textTheme: GoogleFonts.interTextTheme().copyWith(
        headlineLarge: GoogleFonts.spaceGrotesk(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),

        headlineMedium: GoogleFonts.spaceGrotesk(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),

        titleLarge: GoogleFonts.spaceGrotesk(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),

        bodyLarge: GoogleFonts.inter(
          fontSize: 16.sp,
          color: AppColors.textDark,
        ),

        bodyMedium: GoogleFonts.inter(
          fontSize: 14.sp,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
