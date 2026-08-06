import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'profile_menu_tile.dart';

class ProfileMenuOptions extends StatelessWidget {
  final VoidCallback? onInterestsTap;
  final VoidCallback? onSavedEventsTap;
  final VoidCallback? onPaymentMethodsTap;
  final VoidCallback? onSettingsTap;

  const ProfileMenuOptions({
    super.key,
    this.onInterestsTap,
    this.onSavedEventsTap,
    this.onPaymentMethodsTap,
    this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 16.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        children: [
          ProfileMenuTile(
            icon: Icons.auto_awesome_rounded,
            title: 'Interests',
            iconBgColor: const Color(0xFFF0EBFF),
            iconColor: const Color(0xFF6B3CE9),
            onTap: onInterestsTap,
          ),
          _divider(),
          ProfileMenuTile(
            icon: Icons.favorite_outline_rounded,
            title: 'Saved Events',
            iconBgColor: const Color(0xFFF9F4E8),
            iconColor: const Color(0xFF7A5C0A),
            onTap: onSavedEventsTap,
          ),
          _divider(),
          ProfileMenuTile(
            icon: Icons.account_balance_wallet_outlined,
            title: 'Payment Methods',
            iconBgColor: const Color(0xFFF7EFE8),
            iconColor: const Color(0xFFB86E36),
            onTap: onPaymentMethodsTap,
          ),
          _divider(),
          ProfileMenuTile(
            icon: Icons.settings_outlined,
            title: 'Settings',
            iconBgColor: const Color(0xFFEFEFF4),
            iconColor: const Color(0xFF555770),
            onTap: onSettingsTap,
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Divider(color: const Color(0xFFF0F1F6), height: 1.h),
    );
  }
}
