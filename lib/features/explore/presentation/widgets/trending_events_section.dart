import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/routes/app_routes.dart';
import 'package:flutter_task/core/theme/text_styles.dart';
import 'package:flutter_task/features/explore/presentation/bloc/explore_bloc.dart';
import 'package:flutter_task/features/explore/presentation/widgets/app_card.dart';
import 'package:go_router/go_router.dart';

class TrendingEventsSection extends StatelessWidget {
  const TrendingEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final cardWidth = screenWidth < 600
        ? screenWidth * 0.75
        : screenWidth * 0.42;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //---------------------------------------
        // Header
        //---------------------------------------
        Row(
          children: [
            Expanded(
              child: Text(
                "Trending Now",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.h3,
              ),
            ),

            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(70.w, 40.h),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              ),
              onPressed: () {
                context.push(AppRoutes.ticket);
              },
              child: Text("View All", style: AppTextStyles.bodyExtraSmall),
            ),
          ],
        ),

        SizedBox(height: 14.h),

        //---------------------------------------
        // BLoC Data
        //---------------------------------------
        BlocBuilder<ExploreBloc, ExploreState>(
          builder: (context, state) {
            // Loading
            if (state is IsLoadingExplore) {
              return const SizedBox(
                height: 250,
                child: Center(child: CircularProgressIndicator()),
              );
            }

            // Error
            if (state is ErrorExplore) {
              return SizedBox(
                height: 250,
                child: Center(child: Text(state.message)),
              );
            }

            // Loaded
            if (state is ExploreLoaded) {
              final events = state.trendingEvents;

              if (events.isEmpty) {
                return const SizedBox(
                  height: 250,
                  child: Center(child: Text('No trending events found')),
                );
              }

              return SizedBox(
                height: 0.45.sh,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: events.length,
                  separatorBuilder: (_, _) => SizedBox(width: 16.w),
                  itemBuilder: (context, index) {
                    final event = events[index];

                    return SizedBox(
                      width: cardWidth,
                      child: AppCard(eventEntity: event),
                    );
                  },
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
