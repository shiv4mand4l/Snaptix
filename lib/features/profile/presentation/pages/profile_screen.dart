import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/routes/app_routes.dart';
import 'package:flutter_task/shared/widgets/snaptix_app_bar_widget.dart';
import 'package:go_router/go_router.dart';

import '../widgets/logout_button.dart';
import '../widgets/profile_menu_options.dart';
import '../widgets/profile_stats_card.dart';
import '../widgets/profile_tickets_carousel.dart';
import '../widgets/user_profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final isSmall = width < 360;

    final isTablet = width >= 600;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFC),

      appBar: SnaptixAppBarWidget(
        title: 'Profile',

        // actions: [AppBarAction(icon: Icons.search_rounded, onTap: () {})],
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),

            padding: EdgeInsets.symmetric(
              horizontal: isSmall
                  ? 16.w
                  : isTablet
                  ? 40.w
                  : 20.w,

              vertical: isTablet ? 20.h : 12.h,
            ),

            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),

              child: Column(
                children: [
                  // Profile Header
                  UserProfileHeader(
                    avatarUrl: 'assets/images/profile.png',

                    userName: 'Shivam Mandal',

                    location: 'Janakpur, JNKP',

                    onEditAvatarTap: () {},
                  ),

                  SizedBox(height: isTablet ? 32.h : 24.h),

                  // Stats
                  const ProfileStatsCard(
                    activeEventsText: '12 Active',

                    rewardPointsText: '2,450 pts',
                  ),

                  SizedBox(height: isTablet ? 32.h : 24.h),

                  // Tickets
                  ProfileTicketsCarousel(
                    onViewAllTap: () {
                      context.push(AppRoutes.ticket);
                    },
                  ),

                  SizedBox(height: isTablet ? 32.h : 24.h),

                  // Menu
                  ProfileMenuOptions(
                    onInterestsTap: () {},

                    onSavedEventsTap: () {},

                    onPaymentMethodsTap: () {},

                    onSettingsTap: () {},
                  ),

                  SizedBox(height: isTablet ? 36.h : 28.h),

                  // Logout
                  LogoutButton(
                    onTap: () {
                      context.pushReplacement(AppRoutes.signIn);
                    },
                  ),

                  SizedBox(height: isTablet ? 50.h : 40.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
