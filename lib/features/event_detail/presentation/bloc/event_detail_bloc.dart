import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/event_detail/domain/usecases/get_event_detail_usecase.dart';

import '../../domain/entities/event_detail.dart';
import '../../domain/entities/organizer.dart';
import '../../domain/entities/similar_event.dart';

import 'event_detail_event.dart';
import 'event_detail_state.dart';

class EventDetailBloc extends Bloc<EventDetailEvent, EventDetailState> {
  EventDetailBloc({required GetEventDetailUseCase getEventDetailUseCase})
    : super(const EventDetailInitial()) {
    on<LoadEventDetail>(_loadEventDetail);
    on<ToggleFavorite>(_toggleFavorite);
    on<ToggleOrganizerFollow>(_toggleOrganizerFollow);
    on<ToggleSimilarEventFavorite>(_toggleSimilarEventFavorite);
  }

  //======================================================
  // Load Event
  //======================================================

  Future<void> _loadEventDetail(
    LoadEventDetail event,
    Emitter<EventDetailState> emit,
  ) async {
    emit(const EventDetailLoading());

    await Future.delayed(const Duration(milliseconds: 700));

    emit(EventDetailLoaded(eventDetail: _mockEvent()));
  }

  //======================================================
  // Toggle Favourite Event
  //======================================================

  void _toggleFavorite(ToggleFavorite event, Emitter<EventDetailState> emit) {
    if (state is! EventDetailLoaded) return;

    final currentState = state as EventDetailLoaded;
    final current = currentState.eventDetail;

    emit(
      currentState.copyWith(
        eventDetail: current.copyWith(isFavorite: !current.isFavorite),
        userMessage: current.isFavorite
            ? "Removed from Favorites"
            : "Added to Favorites",
      ),
    );
  }

  //======================================================
  // Toggle Organizer Follow
  //======================================================

  void _toggleOrganizerFollow(
    ToggleOrganizerFollow event,
    Emitter<EventDetailState> emit,
  ) {
    if (state is! EventDetailLoaded) return;

    final currentState = state as EventDetailLoaded;
    final current = currentState.eventDetail;

    emit(
      currentState.copyWith(
        eventDetail: current.copyWith(
          organizer: current.organizer.copyWith(
            isFollowing: !current.organizer.isFollowing,
          ),
        ),
      ),
    );
  }

  //======================================================
  // Toggle Similar Event Favourite
  //======================================================

  void _toggleSimilarEventFavorite(
    ToggleSimilarEventFavorite event,
    Emitter<EventDetailState> emit,
  ) {
    if (state is! EventDetailLoaded) return;

    final currentState = state as EventDetailLoaded;
    final current = currentState.eventDetail;

    final updatedEvents = current.similarEvents.map((e) {
      if (e.id == event.eventId) {
        return e.copyWith(isFavorite: !e.isFavorite);
      }
      return e;
    }).toList();

    emit(
      currentState.copyWith(
        eventDetail: current.copyWith(similarEvents: updatedEvents),
      ),
    );
  }

  //======================================================
  // Mock Data
  //======================================================

  EventDetail _mockEvent() {
    return EventDetail(
      id: "1",
      bannerImageUrl:
          "https://images.unsplash.com/photo-1516450360452-9312f5e86fc7",
      badgeText: "SOLD OUT SOON",
      title: "Coldplay Live Concert",
      dateTimeText: "Fri, Jun 18 • 8:00 PM",
      monthText: "JUN",
      dayText: "18",
      dateTitle: "Friday, June 18, 08:00 PM",
      dateSubtitle: "Door opens at 07:30 PM",
      locationTitle: "Kathmandu Stadium",
      locationSubtitle: "Kathmandu, Nepal",
      aboutDescription:
          "Enjoy one of the biggest live concerts of the year. Experience an unforgettable night of live music, dazzling lights, and incredible performances by world-class artists. Sing along to your favorite songs, enjoy an electrifying atmosphere, and create memories that will last a lifetime.",
      organizer: const Organizer(
        id: "org_1",
        logoUrl: "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
        name: "Music Nepal",
        rating: 4.9,
        reviewsCount: '1.2k Reviews',
        isFollowing: false,
      ),
      similarEvents: const [
        SimilarEvent(
          id: "1",
          imageUrl:
              "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f",
          category: "ROCK",
          title: "Rock Night",
          dateAndLocation: "Jun 25 • Lalitpur",
          isFavorite: false,
        ),
        SimilarEvent(
          id: "2",
          imageUrl:
              "https://images.unsplash.com/photo-1501386761578-eac5c94b800a",
          category: "POP",
          title: "Pop Festival",
          dateAndLocation: "Jul 1 • Bhaktapur",
          isFavorite: true,
        ),
      ],
      priceText: "\$89",
      isFavorite: false,
    );
  }
}
