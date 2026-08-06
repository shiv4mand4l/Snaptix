import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand Colors
  static const Color primary = Color(0xFF6C2BD9); // Snap Violet
  static const Color accent = Color(0xFFFFC629); // Ticket Yellow
  static const Color accentDark = Color(0xFF7A5C0A); // Dark Gold

  // Neutral Colors
  static const Color textDark = Color(0xFF0F0F14); // Ink Black
  static const Color background = Color(0xFFFAFAFC); // Cloud White
  static const Color surface = Colors.white;

  // Status Colors
  static const Color success = Color(0xFF1FAE6B);
  static const Color warning = Color(0xFFF5A524);
  static const Color error = Color(0xFFE5484D);
  static const Color info = Color(0xFF3B82F6);

  // Text Colors
  static const Color textPrimary = textDark;
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFF9CA3AF);

  // Divider & Border
  static const Color divider = Color(0xFFE5E7EB);
  static const Color border = Color(0xFFD1D5DB);

  // Disabled
  static const Color disabled = Color(0xFFBDBDBD);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    // colors: [Color(0xFF6C2BD9), Color(0xFFC026D3)],
    colors: [Color(0xFF6C2BD9), Color(0xFFC026D3), Color(0xFF8B5CF6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
