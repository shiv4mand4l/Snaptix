import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/banner_entity.dart';
import '../../domain/entities/category_entities.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/usecases/get_explore_data_usecase.dart';
import '../../domain/usecases/search_events_usecase.dart';
import '../../domain/usecases/toggle_favourite_usecase.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final GetExploreDataUseCase getExploreDataUseCase;
  final SearchEventsUseCase searchEventsUseCase;
  final ToggleFavouriteUseCase toggleFavouriteUseCase;
  ExploreBloc({
    required this.getExploreDataUseCase,
    required this.searchEventsUseCase,
    required this.toggleFavouriteUseCase,
  }) : super(ExploreInitial()) {
    on<LoadExplore>(_onLoadExplore);
    on<RefreshExplore>(_onRefreshExplore);
    on<SelectCategory>(_onSelectCategory);
    on<SearchEvent>(_onSearchEvent);
    on<ToggleFavourite>(_onToggleFavourite);
  }

  Future<void> _onLoadExplore(
    LoadExplore event,
    Emitter<ExploreState> emit,
  ) async {
    emit(IsLoadingExplore());
    try {
      final data = await getExploreDataUseCase();
      emit(
        ExploreLoaded(
          categories: data.categories,
          trendingEvents: data.trendingEvents,
          nearbyEvents: data.nearbyEvents,
          featuredBanner: data.featuredBanner,
        ),
      );
    } catch (e) {
      emit(ErrorExplore(message: e.toString()));
    }
  }

  Future<void> _onRefreshExplore(
    RefreshExplore event,
    Emitter<ExploreState> emit,
  ) async {
    try {
      final data = await getExploreDataUseCase();
      emit(
        ExploreLoaded(
          categories: data.categories,
          trendingEvents: data.trendingEvents,
          nearbyEvents: data.nearbyEvents,
          featuredBanner: data.featuredBanner,
        ),
      );
    } catch (e) {
      emit(ErrorExplore(message: e.toString()));
    }
  }

  void _onSelectCategory(SelectCategory event, Emitter<ExploreState> emit) {
    if (state is ExploreLoaded) {
      final currentState = state as ExploreLoaded;
      emit(currentState.copyWith(selectedCategoryId: event.categoryId));
    }
  }

  Future<void> _onSearchEvent(
    SearchEvent event,
    Emitter<ExploreState> emit,
  ) async {
    if (state is ExploreLoaded) {
      final currentState = state as ExploreLoaded;
      final results = await searchEventsUseCase(event.query);
      emit(currentState.copyWith(trendingEvents: results));
    }
  }

  Future<void> _onToggleFavourite(
    ToggleFavourite event,
    Emitter<ExploreState> emit,
  ) async {
    if (state is ExploreLoaded) {
      final currentState = state as ExploreLoaded;
      await toggleFavouriteUseCase(event.eventId);
      final updatedNearby = currentState.nearbyEvents.map((e) {
        if (e.id == event.eventId) {
          return e.copyWith(isFavourite: !e.isFavourite);
        }
        return e;
      }).toList();
      emit(currentState.copyWith(nearbyEvents: updatedNearby));
    }
  }
}
