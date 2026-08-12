part of 'explore_bloc.dart';

sealed class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

final class LoadExplore extends ExploreEvent {}

final class RefreshExplore extends ExploreEvent {}

final class SelectCatagory extends ExploreEvent {
  final int categoryId;
  final String categoryTitle;

  const SelectCatagory(this.categoryId, this.categoryTitle);

  @override
  List<Object> get props => [categoryId, categoryTitle];
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
