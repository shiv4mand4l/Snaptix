import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/features/explore/presentation/bloc/explore_bloc.dart';

import 'package:flutter_task/shared/widgets/app_floating_action_button.dart';
import 'package:flutter_task/shared/widgets/app_loader.dart';
import '../../../../shared/widgets/snaptix_app_bar_widget.dart';

import '../widgets/explore_search_bar.dart';
import '../widgets/category_chips_bar.dart';
import '../widgets/trending_events_section.dart';
import '../widgets/host_event_banner.dart';
import '../widgets/near_you_events_section.dart';
import 'widgets/app_bar_action.dart';
import 'widgets/notification_action_icon.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,

      appBar: SnaptixAppBarWidget(
        actions: [
          NotificationActionIcon(onTap: () {}),
          AppBarAction(icon: Icons.search_rounded, onTap: () {}),
        ],
      ),

      body: SafeArea(
        top: false,
        child: BlocBuilder<ExploreBloc, ExploreState>(
          builder: (context, state) {
            if (state is IsLoadingExplore) {
              return const Center(child: AppLoader());
            }

            if (state is ErrorExplore) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Text(
                    "Error: ${state.message}",
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            if (state is ExploreLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<ExploreBloc>().add(LoadExplore());
                },
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final maxWidth = constraints.maxWidth > 700
                        ? 700.0
                        : constraints.maxWidth;

                    return Align(
                      alignment: Alignment.topCenter,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: maxWidth),
                        child: SingleChildScrollView(
                          // physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.fromLTRB(
                            20.w,
                            12.h,
                            20.w,
                            100.h, // Space for FAB
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ExploreSearchBar(),

                              SizedBox(height: 16.h),

                              CategoryChipsBar(
                                selectedCatagoryId: state.selectedCategoryId,
                              ),

                              SizedBox(height: 24.h),

                              const TrendingEventsSection(),

                              SizedBox(height: 24.h),

                              HostEventBanner(
                                bannerEntity: state.featuredBanner,
                              ),

                              SizedBox(height: 24.h),

                              NearYouEventsSection(
                                nearbyEventEntity: state.nearbyEvents,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),

      floatingActionButton: AppFloatingActionButton(
        onPressed: () {},
        icon: Icons.add,
        backgroundColor: AppColors.accentDark,
        elevation: 4,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
