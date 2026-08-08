import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_task/features/saved/presentation/pages/saved_events_screen.dart';

import '../../../explore/presentation/pages/explore_screen.dart';
import '../../../profile/presentation/pages/profile_screen.dart';
import '../../../tickets/presentation/pages/ticket_screen.dart';

import '../bloc/navigation_bloc.dart';
import '../widgets/app_bottom_navigation.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBloc>(
      create: (_) => NavigationBloc(),
      child: const _MainNavigationView(),
    );
  }
}

class _MainNavigationView extends StatelessWidget {
  const _MainNavigationView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return SafeArea(
          top: false,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: IndexedStack(
              index: state.currentIndex,
              children: const [
                ExploreScreen(),
                TicketScreen(),
                SavedEventsScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: const AppBottomNavigation(),
          ),
        );
      },
    );
  }
}
