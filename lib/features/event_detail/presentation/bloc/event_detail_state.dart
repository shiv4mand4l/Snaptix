import 'package:equatable/equatable.dart';

import '../../domain/entities/event_detail.dart';

abstract class EventDetailState extends Equatable {
  const EventDetailState();

  @override
  List<Object?> get props => [];
}

/// Initial
class EventDetailInitial extends EventDetailState {
  const EventDetailInitial();
}

/// Loading
class EventDetailLoading extends EventDetailState {
  const EventDetailLoading();
}

/// Loaded
class EventDetailLoaded extends EventDetailState {
  final EventDetail eventDetail;

  /// Snackbar message
  final String? userMessage;

  const EventDetailLoaded({required this.eventDetail, this.userMessage});

  EventDetailLoaded copyWith({EventDetail? eventDetail, String? userMessage}) {
    return EventDetailLoaded(
      eventDetail: eventDetail ?? this.eventDetail,
      userMessage: userMessage,
    );
  }

  @override
  List<Object?> get props => [eventDetail, userMessage];
}

/// Error
class EventDetailError extends EventDetailState {
  final String message;

  const EventDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
