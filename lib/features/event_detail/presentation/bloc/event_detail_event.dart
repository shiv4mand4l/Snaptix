import 'package:equatable/equatable.dart';

abstract class EventDetailEvent extends Equatable {
  const EventDetailEvent();

  @override
  List<Object?> get props => [];
}

class LoadEventDetail extends EventDetailEvent {
  final String eventId;

  const LoadEventDetail(this.eventId);
}

class ToggleFavorite extends EventDetailEvent {
  const ToggleFavorite();
}

class ToggleOrganizerFollow extends EventDetailEvent {
  const ToggleOrganizerFollow();
}

class ToggleSimilarEventFavorite extends EventDetailEvent {
  final String eventId;

  const ToggleSimilarEventFavorite(this.eventId);
}

class BookTickets extends EventDetailEvent {
  const BookTickets();
}
