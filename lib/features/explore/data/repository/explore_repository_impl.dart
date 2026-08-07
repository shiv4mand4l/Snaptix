import 'package:flutter_task/features/explore/domain/entities/nearby_event_entities.dart';

import '../../domain/entities/banner_entity.dart';
import '../../domain/entities/category_entities.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/repository/explore_repositories.dart';
import '../datasource/local/explore_local_data_source.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  final ExploreLocalDataSource localDataSource;

  ExploreRepositoryImpl({required this.localDataSource});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    return await localDataSource.fetchCategories();
  }

  @override
  Future<List<EventEntity>> getTrendingEvents() async {
    return await localDataSource.fetchTrendingEvents();
  }

  @override
  Future<List<NearbyEventEntity>> getNearbyEvents() async {
    return await localDataSource.fetchNearbyEvents();
  }

  @override
  Future<BannerEntity> getFeaturedBanner() async {
    return await localDataSource.fetchFeaturedBanner();
  }

  @override
  Future<List<EventEntity>> searchEvents(String query) async {
    return await localDataSource.searchEvents(query);
  }

  @override
  Future<bool> toggleFavourite(int eventId) async {
    return await localDataSource.toggleFavourite(eventId);
  }
}
