import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../bloc/navigation_bloc.dart';
import 'bottom_navigation_item.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({super.key});

  static const items = [
    (label: 'Explore', icon: Icons.explore_outlined, active: Icons.explore),
    (
      label: 'Tickets',
      icon: Icons.confirmation_number_outlined,
      active: Icons.confirmation_number,
    ),
    (label: 'Saved', icon: Icons.favorite_border, active: Icons.favorite),
    (label: 'Profile', icon: Icons.person_outline, active: Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return SafeArea(
          top: false,
          child: Container(
            constraints: BoxConstraints(minHeight: 64.h, maxHeight: 80.h),
            padding: EdgeInsets.symmetric(vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border(
                top: BorderSide(color: AppColors.divider, width: 1.w),
              ),
            ),
            child: Row(
              children: List.generate(items.length, (index) {
                final item = items[index];

                return Expanded(
                  child: PopScope(
                    canPop: true,
                    onPopInvokedWithResult: (didPop, result) {
                      context.read<NavigationBloc>().add(
                        OnChangeNavigationIndex(index: 0),
                      );
                    },
                    child: BottomNavigationItemWidget(
                      label: item.label,
                      icon: item.icon,
                      activeIcon: item.active,
                      isSelected: state.currentIndex == index,
                      onTap: () {
                        context.read<NavigationBloc>().add(
                          OnChangeNavigationIndex(index: index),
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
