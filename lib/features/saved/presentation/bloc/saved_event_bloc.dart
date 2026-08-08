import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_task/features/saved/domain/usecases/get_saved_events_usecase.dart';
import 'package:flutter_task/features/saved/domain/usecases/toggle_saved_event_usecase.dart';

import 'saved_event_event.dart';
import 'saved_event_state.dart';

class SavedEventsBloc extends Bloc<SavedEventsEvent, SavedEventsState> {
  final GetSavedEventsUsecase getSavedEventsUsecase;
  final ToggleSavedEventUsecase toggleSavedEventUsecase;

  SavedEventsBloc({
    required this.getSavedEventsUsecase,
    required this.toggleSavedEventUsecase,
  }) : super(SavedEventsInitial()) {
    on<LoadSavedEvents>(_loadSavedEvents);
    on<FilterEvents>(_filterEvents);
    on<ToggleSaveEvent>(_toggleSave);
  }

  Future<void> _loadSavedEvents(
    LoadSavedEvents event,
    Emitter<SavedEventsState> emit,
  ) async {
    emit(SavedEventsLoading());

    try {
      final events = await getSavedEventsUsecase.call();

      emit(
        SavedEventsLoaded(
          allEvents: events,
          filteredEvents: events,
          selectedCategory: 'All Events',
        ),
      );
    } catch (e) {
      emit(SavedEventsError(message: e.toString()));
    }
  }

  void _filterEvents(FilterEvents event, Emitter<SavedEventsState> emit) {
    if (state is! SavedEventsLoaded) return;

    final current = state as SavedEventsLoaded;

    List filtered;

    if (event.category == 'All Events') {
      filtered = current.allEvents;
    } else {
      filtered = current.allEvents.where((e) {
        return e.category == event.category;
      }).toList();
    }

    emit(
      current.copyWith(
        filteredEvents: filtered.cast(),
        selectedCategory: event.category,
      ),
    );
  }

  Future<void> _toggleSave(
    ToggleSaveEvent event,
    Emitter<SavedEventsState> emit,
  ) async {
    if (state is! SavedEventsLoaded) {
      return;
    }

    final currentState = state as SavedEventsLoaded;

    // 1. Update all events
    final updatedAllEvents = currentState.allEvents.map((savedItem) {
      if (savedItem.id == event.eventId) {
        final updatedItem = savedItem.copyWith(isSaved: !savedItem.isSaved);

        return updatedItem;
      }

      return savedItem;
    }).toList();

    // 2. Rebuild filtered events from updated allEvents
    final updatedFilteredEvents = currentState.selectedCategory == 'All Events'
        ? updatedAllEvents
        : updatedAllEvents
              .where((event) => event.category == currentState.selectedCategory)
              .toList();

    // 3. Emit both updated lists
    emit(
      currentState.copyWith(
        allEvents: updatedAllEvents,
        filteredEvents: updatedFilteredEvents,
      ),
    );
  }
}
