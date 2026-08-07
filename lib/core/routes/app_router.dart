import 'package:flutter/material.dart';
import 'package:flutter_task/features/auth/presentation/pages/signin/sign_in_screen.dart';
import 'package:flutter_task/features/auth/presentation/pages/signup/sign_up_screen.dart';
import 'package:flutter_task/features/event_detail/presentation/screens/event_detail_screen.dart';

// Pages
import 'package:flutter_task/features/explore/presentation/pages/explore_screen.dart';
import 'package:flutter_task/features/main/presentation/pages/main_navigation_screen.dart';
import 'package:flutter_task/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:flutter_task/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter_task/features/saved/presentation/pages/saved_events_screen.dart';
import 'package:flutter_task/features/tickets/presentation/pages/ticket_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/confirmation/presentation/pages/confirmation_screen.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';

import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.splash,

    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        name: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.signIn,
        name: '/signIn',
        builder: (context, state) => const SigInScreen(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        name: '/signUp',
        builder: (context, state) => const SignUpScreen(),
      ),

      GoRoute(
        path: AppRoutes.main,
        name: '/mainNavigation',
        builder: (context, state) => const MainNavigationScreen(),
      ),

      GoRoute(
        path: AppRoutes.explore,
        name: '/explore',
        builder: (context, state) => const ExploreScreen(),
      ),

      GoRoute(
        path: AppRoutes.savedEvent,
        name: '/savedEvent',
        builder: (context, state) => const SavedEventsScreen(),
      ),

      GoRoute(
        path: AppRoutes.ticket,
        name: '/ticket',
        builder: (context, state) => const TicketScreen(),
      ),
      GoRoute(
        path: AppRoutes.eventDetail,
        name: '/eventDetail',
        builder: (context, state) => const EventDetailScreen(eventId: '1'),
      ),
      GoRoute(
        path: AppRoutes.confirmation,
        name: '/confirmation',
        builder: (context, state) => const ConfirmationScreen(),
      ),

      GoRoute(
        path: AppRoutes.profile,
        name: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
    ],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('No route found: ${state.uri}'))),
  );
}
