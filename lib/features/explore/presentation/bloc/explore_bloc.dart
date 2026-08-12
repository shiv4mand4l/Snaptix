import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/explore/domain/entities/nearby_event_entities.dart';

import '../../domain/entities/banner_entity.dart';
import '../../domain/entities/category_entities.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/usecases/get_featured_banner_usecase.dart';
import '../../domain/usecases/get_nearby_events_usecase.dart';
import '../../domain/usecases/get_trending_events_usecase.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetTrendingEventsUseCase getTrendingEventsUseCase;
  final GetNearbyEventsUseCase getNearbyEventsUseCase;
  final GetFeaturedBannerUseCase getFeaturedBannerUseCase;
  ExploreBloc({
    required this.getCategoriesUseCase,
    required this.getTrendingEventsUseCase,
    required this.getNearbyEventsUseCase,
    required this.getFeaturedBannerUseCase,
  }) : super(ExploreInitial()) {
    on<LoadExplore>(_onLoadExplore);
    on<RefreshExplore>(_onRefreshExplore);
    on<SelectCatagory>(_onSelectCategory);
    // on<SearchEvent>(_onSearchEvent);
    // on<ToggleFavourite>(_onToggleFavourite);
  }

  Future<void> _onLoadExplore(
    LoadExplore event,
    Emitter<ExploreState> emit,
  ) async {
    emit(IsLoadingExplore());
    try {
      final categories = await getCategoriesUseCase();
      final trendingEvents = await getTrendingEventsUseCase();
      final nearbyEvents = await getNearbyEventsUseCase();
      final featuredBanner = await getFeaturedBannerUseCase();
      emit(
        ExploreLoaded(
          categories: categories,
          trendingEvents: trendingEvents,
          nearbyEvents: nearbyEvents,
          featuredBanner: featuredBanner,
          allTrendingEvents: trendingEvents,
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
      final categories = await getCategoriesUseCase();
      final trendingEvents = await getTrendingEventsUseCase();
      final nearbyEvents = await getNearbyEventsUseCase();
      final featuredBanner = await getFeaturedBannerUseCase();
      emit(
        ExploreLoaded(
          categories: categories,
          trendingEvents: trendingEvents,
          nearbyEvents: nearbyEvents,
          featuredBanner: featuredBanner,
          allTrendingEvents: trendingEvents,
        ),
      );
    } catch (e) {
      emit(ErrorExplore(message: e.toString()));
    }
  }

  void _onSelectCategory(SelectCatagory event, Emitter<ExploreState> emit) {
    // emit(IsLoadingExplore());
    if (state is! ExploreLoaded) return;

    final currentState = state as ExploreLoaded;

    final filterdEvents = event.categoryId == 0
        ? currentState.allTrendingEvents
        : currentState.allTrendingEvents.where((eventItem) {
            return eventItem.catagoryId == event.categoryId;
          }).toList();

    emit(
      currentState.copyWith(
        selectedCategoryIndex: event.categoryId,
        selectedCategoryId: event.categoryId,
        selectedCategoryTitle: event.categoryTitle,
        trendingEvents: filterdEvents,
      ),
    );
  }

  // Future<void> _onSearchEvent(
  //   SearchEvent event,
  //   Emitter<ExploreState> emit,
  // ) async {
  //   if (state is ExploreLoaded) {
  //     final currentState = state as ExploreLoaded;
  //     final results = await getNearbyEventsUseCase();
  //     emit(currentState.copyWith(trendingEvents: results ));
  //   }
  // }

  // Future<void> _onToggleFavourite(
  //   ToggleFavourite event,
  //   Emitter<ExploreState> emit,
  // ) async {
  //   if (state is ExploreLoaded) {
  //     final currentState = state as ExploreLoaded;
  //     await toggleFavouriteUseCase(event.eventId);
  //     final updatedNearby = currentState.nearbyEvents.map((e) {
  //       if (e.id == event.eventId) {
  //         return e.copyWith(isFavourite: !e.isFavourite);
  //       }
  //       return e;
  //     }).toList();
  //     emit(currentState.copyWith(nearbyEvents: updatedNearby));
  //   }
  // }
}
