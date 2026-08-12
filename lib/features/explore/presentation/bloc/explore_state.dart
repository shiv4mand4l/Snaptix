part of 'explore_bloc.dart';

sealed class ExploreState extends Equatable {
  const ExploreState();

  @override
  List<Object> get props => [];
}

final class ExploreInitial extends ExploreState {
  const ExploreInitial();
}

final class IsLoadingExplore extends ExploreState {
  const IsLoadingExplore();
}

final class ErrorExplore extends ExploreState {
  final String message;

  const ErrorExplore({required this.message});

  @override
  List<Object> get props => [message];
}

/// Loaded State carrying full explore data payload
final class ExploreLoaded extends ExploreState {
  final List<CategoryEntity> categories;

  // Original list — NEVER modify this
  final List<EventEntity> allTrendingEvents;

  // List displayed by UI
  final List<EventEntity> trendingEvents;

  final List<NearbyEventEntity> nearbyEvents;
  final BannerEntity featuredBanner;

  final int selectedCategoryId;
  final int selectedCategoryIndex;
  final String selectedCategoryTitle;

  const ExploreLoaded({
    required this.categories,
    required this.allTrendingEvents,
    required this.trendingEvents,
    required this.nearbyEvents,
    required this.featuredBanner,
    this.selectedCategoryId = 0,
    this.selectedCategoryIndex = 0,
    this.selectedCategoryTitle = 'All',
  });

  ExploreLoaded copyWith({
    List<CategoryEntity>? categories,
    List<EventEntity>? allTrendingEvents,
    List<EventEntity>? trendingEvents,
    List<NearbyEventEntity>? nearbyEvents,
    BannerEntity? featuredBanner,
    int? selectedCategoryId,
    int? selectedCategoryIndex,
    String? selectedCategoryTitle,
  }) {
    return ExploreLoaded(
      categories: categories ?? this.categories,
      allTrendingEvents: allTrendingEvents ?? this.allTrendingEvents,
      trendingEvents: trendingEvents ?? this.trendingEvents,
      nearbyEvents: nearbyEvents ?? this.nearbyEvents,
      featuredBanner: featuredBanner ?? this.featuredBanner,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      selectedCategoryTitle:
          selectedCategoryTitle ?? this.selectedCategoryTitle,
    );
  }

  @override
  List<Object> get props => [
    categories,
    allTrendingEvents,
    trendingEvents,
    nearbyEvents,
    featuredBanner,
    selectedCategoryId,
    selectedCategoryIndex,
    selectedCategoryTitle,
  ];
}
