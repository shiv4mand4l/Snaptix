import 'package:equatable/equatable.dart';
import '../../domain/entities/saved_event_entities.dart';

abstract class SavedEventsState extends Equatable {
  const SavedEventsState();

  @override
  List<Object?> get props => [];
}

class SavedEventsInitial extends SavedEventsState {}

class SavedEventsLoading extends SavedEventsState {}

class SavedEventsLoaded extends SavedEventsState {
  final List<SavedEventEntity> allEvents;
  final List<SavedEventEntity> filteredEvents;
  final String selectedCategory;

  const SavedEventsLoaded({
    required this.allEvents,
    required this.filteredEvents,
    required this.selectedCategory,
  });

  SavedEventsLoaded copyWith({
    List<SavedEventEntity>? allEvents,
    List<SavedEventEntity>? filteredEvents,
    String? selectedCategory,
  }) {
    return SavedEventsLoaded(
      allEvents: allEvents ?? this.allEvents,
      filteredEvents: filteredEvents ?? this.filteredEvents,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [allEvents, filteredEvents, selectedCategory];
}

class SavedEventsError extends SavedEventsState {
  final String message;

  const SavedEventsError({required this.message});

  @override
  List<Object?> get props => [message];
}
