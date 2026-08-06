import 'package:equatable/equatable.dart';

abstract class SavedEventsEvent extends Equatable {
  const SavedEventsEvent();

  @override
  List<Object?> get props => [];
}

/// Load all saved events
class LoadSavedEvents extends SavedEventsEvent {}

/// Filter by category
class FilterEvents extends SavedEventsEvent {
  final String category;

  const FilterEvents(this.category);

  @override
  List<Object?> get props => [category];
}

/// Toggle bookmark
class ToggleSaveEvent extends SavedEventsEvent {
  final String eventId;

  const ToggleSaveEvent(this.eventId);

  @override
  List<Object?> get props => [eventId];
}
