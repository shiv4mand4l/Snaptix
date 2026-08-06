// domain/usecases/get_explore_data_usecase.dart
import '../entities/category_entities.dart';
import '../entities/event_entity.dart';
import '../entities/banner_entity.dart';
import '../repository/explore_repositories.dart';

class ExploreData {
  final List<CategoryEntity> categories;
  final List<EventEntity> trendingEvents;
  final List<EventEntity> nearbyEvents;
  final BannerEntity featuredBanner;

  ExploreData({
    required this.categories,
    required this.trendingEvents,
    required this.nearbyEvents,
    required this.featuredBanner,
  });
}

class GetExploreDataUseCase {
  final ExploreRepository repository;

  GetExploreDataUseCase(this.repository);

  Future<ExploreData> call() async {
    final categories = await repository.getCategories();
    final trendingEvents = await repository.getTrendingEvents();
    final nearbyEvents = await repository.getNearbyEvents();
    final banner = await repository.getFeaturedBanner();

    return ExploreData(
      categories: categories,
      trendingEvents: trendingEvents,
      nearbyEvents: nearbyEvents,
      featuredBanner: banner,
    );
  }
}
