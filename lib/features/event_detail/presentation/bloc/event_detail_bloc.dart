import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/event_detail/domain/usecases/get_event_detail_usecase.dart';

import 'event_detail_event.dart';
import 'event_detail_state.dart';

class EventDetailBloc extends Bloc<EventDetailEvent, EventDetailState> {
  final GetEventDetailUseCase getEventDetailUseCase;

  EventDetailBloc(this.getEventDetailUseCase)
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

    try {
      final eventDetails = await getEventDetailUseCase.call(event.eventId);

      emit(EventDetailLoaded(eventDetail: eventDetails));
    } catch (e) {
      emit(EventDetailError(message: e.toString()));
    }
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
            ? 'Removed from Favorites'
            : 'Added to Favorites',
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

    final updatedEvents = current.similarEvents.map((similarEvent) {
      if (similarEvent.id == event.eventId) {
        return similarEvent.copyWith(isFavorite: !similarEvent.isFavorite);
      }

      return similarEvent;
    }).toList();

    emit(
      currentState.copyWith(
        eventDetail: current.copyWith(similarEvents: updatedEvents),
      ),
    );
  }
}
