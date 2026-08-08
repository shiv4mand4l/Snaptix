import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import 'package:flutter_task/features/explore/presentation/pages/widgets/app_bar_action.dart';
import 'package:flutter_task/features/saved/domain/entities/saved_event_entities.dart';
import 'package:flutter_task/shared/widgets/app_loader.dart';
import 'package:flutter_task/shared/widgets/snaptix_app_bar_widget.dart';

import '../../../explore/presentation/pages/widgets/notification_action_icon.dart';
import '../bloc/saved_event_bloc.dart';
import '../bloc/saved_event_event.dart';
import '../bloc/saved_event_state.dart';
import '../widgets/event_card_compact.dart';
import '../widgets/event_card_main.dart';
import '../widgets/filter_chips_row.dart';

class SavedEventsScreen extends StatefulWidget {
  const SavedEventsScreen({super.key});

  @override
  State<SavedEventsScreen> createState() => _SavedEventsScreenState();
}

class _SavedEventsScreenState extends State<SavedEventsScreen> {
  @override
  Widget build(BuildContext context) {
    final isTablet = ScreenUtil().screenWidth >= 600;

    return Scaffold(
      appBar: SnaptixAppBarWidget(
        title: 'Saved',
        actions: [
          NotificationActionIcon(
            onTap: () {},
            showBadge: false,
            color: AppColors.textSecondary,
          ),
          AppBarAction(icon: Icons.search_rounded, onTap: () {}),
        ],
      ),

      body: BlocBuilder<SavedEventsBloc, SavedEventsState>(
        builder: (context, state) {
          if (state is SavedEventsInitial || state is SavedEventsLoading) {
            return const AppLoader();
          }

          if (state is SavedEventsLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<SavedEventsBloc>().add(LoadSavedEvents());
              },
              color: AppColors.primary,

              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),

                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isTablet ? 900.w : double.infinity,
                    ),

                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 3.w,
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          /// Header
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  'Saved Events',
                                  style: AppTextStyles.ticketTitle,
                                ),

                                SizedBox(height: 6.h),

                                Text(
                                  'Your curated list of upcoming experiences, events, and activities. Discover what’s next.',
                                  style: AppTextStyles.bodySmall.copyWith(
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20.h),

                          /// Filter Chips
                          FilterChipsRow(
                            selectedCategory: state.selectedCategory,
                          ),

                          SizedBox(height: 24.h),

                          /// Events
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),

                            child: _buildEventList(
                              state.filteredEvents,
                              isTablet,
                            ),
                          ),

                          SizedBox(height: 32.h),

                          /// Footer
                          Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.primary.withValues(
                                    alpha: 0.7,
                                  ),
                                  size: 28.sp,
                                ),

                                SizedBox(height: 6.h),

                                Text(
                                  'Viewing ${state.filteredEvents.length} of ${state.allEvents.length} saved events',
                                  style: AppTextStyles.caption,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }

          if (state is SavedEventsError) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(24.r),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(
                      Icons.error_outline,
                      color: AppColors.error,
                      size: 64.sp,
                    ),

                    SizedBox(height: 16.h),

                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.sp),
                    ),

                    SizedBox(height: 20.h),

                    ElevatedButton(
                      onPressed: () {
                        context.read<SavedEventsBloc>().add(LoadSavedEvents());
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildEventList(List<SavedEventEntity> events, bool isTablet) {
    /// Empty state
    if (events.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 60.h),

          child: Column(
            children: [
              Icon(
                Icons.bookmark_border,
                size: 60.sp,
                color: AppColors.disabled,
              ),

              SizedBox(height: 12.h),

              Text(
                'No saved events found in this category.',
                style: AppTextStyles.bodySmall,
              ),
            ],
          ),
        ),
      );
    }

    /// ================================
    /// MOBILE
    /// ================================
    if (!isTablet) {
      return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),

        shrinkWrap: true,

        itemCount: events.length,

        separatorBuilder: (_, _) => SizedBox(height: 20.h),

        itemBuilder: (context, index) {
          final event = events[index];

          if (event.isTrending) {
            return EventCardMain(event: event);
          }

          return EventCardCompact(savedEventEntities: event);
        },
      );
    }

    /// ================================
    /// TABLET
    /// ================================

    final trendingEvents = events.where((event) => event.isTrending).toList();

    final regularEvents = events.where((event) => !event.isTrending).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        /// Trending Events
        if (trendingEvents.isNotEmpty) ...[
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),

            shrinkWrap: true,

            itemCount: trendingEvents.length,

            separatorBuilder: (_, _) => SizedBox(height: 20.h),

            itemBuilder: (context, index) {
              return EventCardMain(event: trendingEvents[index]);
            },
          ),

          SizedBox(height: 20.h),
        ],

        /// Regular Events
        if (regularEvents.isNotEmpty)
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),

            shrinkWrap: true,

            itemCount: regularEvents.length,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 0.84,
            ),

            itemBuilder: (context, index) {
              return EventCardCompact(savedEventEntities: regularEvents[index]);
            },
          ),
      ],
    );
  }
}
