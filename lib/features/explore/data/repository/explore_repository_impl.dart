import '../../domain/entities/category_entities.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/entities/banner_entity.dart';
import '../../domain/repository/explore_repositories.dart';
import '../datasource/local/explore_remote_data_source.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  final ExploreRemoteDataSource remoteDataSource;

  ExploreRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CategoryEntity>> getCategories() =>
      remoteDataSource.fetchCategories();

  @override
  Future<List<EventEntity>> getTrendingEvents() =>
      remoteDataSource.fetchTrendingEvents();

  @override
  Future<List<EventEntity>> getNearbyEvents() =>
      remoteDataSource.fetchNearbyEvents();

  @override
  Future<BannerEntity> getFeaturedBanner() =>
      remoteDataSource.fetchFeaturedBanner();

  @override
  Future<List<EventEntity>> searchEvents(String query) =>
      remoteDataSource.searchEvents(query);

  @override
  Future<bool> toggleFavourite(int eventId) =>
      remoteDataSource.toggleFavourite(eventId);
}
