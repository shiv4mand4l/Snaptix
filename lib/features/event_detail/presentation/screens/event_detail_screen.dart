import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/shared/widgets/app_loader.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';

import '../../../../core/routes/app_routes.dart';
import '../bloc/event_detail_bloc.dart';
import '../bloc/event_detail_event.dart';
import '../bloc/event_detail_state.dart';

import '../widgets/event_header_banner.dart';
import '../widgets/event_info_card.dart';
import '../widgets/event_about_section.dart';
import '../widgets/organizer_info_card.dart';
import '../widgets/event_location_section.dart';
import '../widgets/similar_events_section.dart';
import '../widgets/bottom_booking_bar.dart';

class EventDetailScreen extends StatefulWidget {
  final String eventId;

  const EventDetailScreen({super.key, required this.eventId});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  void initState() {
    super.initState();

    context.read<EventDetailBloc>().add(LoadEventDetail(widget.eventId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        top: false,
        bottom: false,
        child: BlocConsumer<EventDetailBloc, EventDetailState>(
          listener: (context, state) {
            if (state is EventDetailError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },

          builder: (context, state) {
            if (state is EventDetailLoading) {
              return AppLoader();
            }

            if (state is EventDetailError) {
              return _ErrorView(
                message: state.message,
                eventId: widget.eventId,
              );
            }

            if (state is EventDetailLoaded) {
              final event = state.eventDetail;

              return Stack(
                children: [
                  //---------------------------------------------------
                  // Scrollable Content
                  //---------------------------------------------------
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        // physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            //-----------------------------------------------
                            // Header + Info Card
                            //-----------------------------------------------
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                EventHeaderBanner(
                                  imageUrl: event.bannerImageUrl,
                                  bannerImageUrl: event.bannerImageUrl,
                                  badgeText: event.badgeText,
                                  title: event.title,
                                  dateTimeText: event.dateTimeText,
                                  isFavorite: event.isFavorite,
                                  onFavoriteTap: () {
                                    context.read<EventDetailBloc>().add(
                                      ToggleFavorite(),
                                    );
                                  },
                                ),

                                Padding(
                                  padding: EdgeInsets.only(top: 330.h),
                                  child: EventInfoCard(
                                    monthText: event.monthText,
                                    dayText: event.dayText,
                                    dateTitle: event.dateTitle,
                                    dateSubtitle: event.dateSubtitle,
                                    locationTitle: event.locationTitle,
                                    locationSubtitle: event.locationSubtitle,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 24.h),

                            //-----------------------------------------------
                            // Body
                            //-----------------------------------------------
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w.clamp(16, 28),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //-----------------------------------------
                                  // About
                                  //-----------------------------------------
                                  EventAboutSection(
                                    description: event.aboutDescription,
                                    onReadMoreTap: () {},
                                  ),

                                  SizedBox(height: 24.h),

                                  //-----------------------------------------
                                  // Organizer
                                  //-----------------------------------------
                                  OrganizerInfoCard(
                                    logoUrl: event.organizer.logoUrl,
                                    name: event.organizer.name,
                                    rating: event.organizer.rating,
                                    reviewsCount: event.organizer.reviewsCount,
                                    isFollowing: event.organizer.isFollowing,
                                    onFollowTap: () {
                                      context.read<EventDetailBloc>().add(
                                        ToggleOrganizerFollow(),
                                      );
                                    },
                                  ),

                                  SizedBox(height: 28.h),

                                  //-----------------------------------------
                                  // Location
                                  //-----------------------------------------
                                  EventLocationSection(
                                    address: event.locationSubtitle,
                                    onDirectionsTap: () {},
                                    venueName: event.locationSubtitle,
                                  ),

                                  SizedBox(height: 28.h),

                                  //-----------------------------------------
                                  // Similar Events
                                  //-----------------------------------------
                                  SimilarEventsSection(
                                    events: event.similarEvents,

                                    onSeeAllTap: () {
                                      context.go(AppRoutes.main);
                                    },

                                    onEventTap: (event) {},

                                    onFavoriteToggle: (event) {
                                      context.read<EventDetailBloc>().add(
                                        ToggleSimilarEventFavorite(event.id),
                                      );
                                    },
                                  ),

                                  SizedBox(
                                    height:
                                        100.h +
                                        MediaQuery.of(context).padding.bottom,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  //---------------------------------------------------
                  // Bottom Booking Bar
                  //---------------------------------------------------
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomBookingBar(
                      price: event.priceText,
                      onBookTicketsTap: () {
                        context.push(AppRoutes.confirmation);
                      },
                    ),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final String eventId;

  const _ErrorView({required this.message, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  color: Colors.red,
                  size: 72.sp,
                ),

                SizedBox(height: 20.h),

                Text(
                  "Something went wrong",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 12.h),

                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                ),

                SizedBox(height: 28.h),

                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<EventDetailBloc>().add(
                        LoadEventDetail(eventId),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    child: Text(
                      "Retry",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
