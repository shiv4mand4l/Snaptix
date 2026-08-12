import 'package:equatable/equatable.dart';
import '../../domain/entities/saved_event_entities.dart';

abstract class SavedEventsState extends Equatable {
  const SavedEventsState();

  @override
  List<Object?> get props => [];
}

class SavedEventsInitial extends SavedEventsState {
  const SavedEventsInitial();
}

class SavedEventsLoading extends SavedEventsState {
  const SavedEventsLoading();
}

class SavedEventsLoaded extends SavedEventsState {
  final List<SavedEventEntity> allEvents;
  final List<SavedEventEntity> filteredEvents;
  final String selectedCategory;

  final int selectedCategoryId;
  final int selectedCategoryIndex;
  final String selectedCategoryTitle;

  const SavedEventsLoaded({
    required this.allEvents,
    required this.filteredEvents,
    required this.selectedCategory,
    this.selectedCategoryId = 0,
    this.selectedCategoryIndex = 0,
    this.selectedCategoryTitle = 'All Events',
  });

  SavedEventsLoaded copyWith({
    List<SavedEventEntity>? allEvents,
    List<SavedEventEntity>? filteredEvents,
    String? selectedCategory,

    int? selectedCategoryId,
    int? selectedCategoryIndex,
    String? selectedCategoryTitle,
  }) {
    return SavedEventsLoaded(
      allEvents: allEvents ?? this.allEvents,
      filteredEvents: filteredEvents ?? this.filteredEvents,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      selectedCategoryTitle:
          selectedCategoryTitle ?? this.selectedCategoryTitle,
    );
  }

  @override
  List<Object?> get props => [
    allEvents,
    filteredEvents,
    selectedCategory,
    selectedCategoryId,
    selectedCategoryIndex,
    selectedCategoryTitle,
  ];
}

class SavedEventsError extends SavedEventsState {
  final String message;

  const SavedEventsError({required this.message});

  @override
  List<Object?> get props => [message];
}
