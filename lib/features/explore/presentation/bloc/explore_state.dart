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
  final List<EventEntity> trendingEvents;
  final List<NearbyEventEntity> nearbyEvents;
  final BannerEntity featuredBanner;
  final int selectedCategoryId;
  final String selectedCategory;
  const ExploreLoaded({
    required this.categories,
    required this.trendingEvents,
    required this.nearbyEvents,
    required this.featuredBanner,
    this.selectedCategoryId = 0,
    this.selectedCategory = 'All',
  });
  ExploreLoaded copyWith({
    List<CategoryEntity>? categories,
    List<EventEntity>? trendingEvents,
    List<NearbyEventEntity>? nearbyEvents,
    BannerEntity? featuredBanner,
    int? selectedCategoryId,
    String? selectedCategory,
  }) {
    return ExploreLoaded(
      categories: categories ?? this.categories,
      trendingEvents: trendingEvents ?? this.trendingEvents,
      nearbyEvents: nearbyEvents ?? this.nearbyEvents,
      featuredBanner: featuredBanner ?? this.featuredBanner,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object> get props => [
    categories,
    trendingEvents,
    nearbyEvents,
    featuredBanner,
    selectedCategoryId,
    selectedCategory,
  ];
}
