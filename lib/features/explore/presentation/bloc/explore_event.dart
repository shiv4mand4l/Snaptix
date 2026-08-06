part of 'explore_bloc.dart';

sealed class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

final class LoadExplore extends ExploreEvent {}

final class RefreshExplore extends ExploreEvent {}

final class SelectCategory extends ExploreEvent {
  final int categoryId;

  const SelectCategory({required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}

final class SearchEvent extends ExploreEvent {
  final String query;

  const SearchEvent({required this.query});

  @override
  List<Object> get props => [query];
}

final class ToggleFavourite extends ExploreEvent {
  final int eventId;

  const ToggleFavourite({required this.eventId});

  @override
  List<Object> get props => [eventId];
}
