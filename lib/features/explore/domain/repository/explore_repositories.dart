import '../entities/category_entities.dart';
import '../entities/event_entity.dart';
import '../entities/banner_entity.dart';

abstract class ExploreRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<List<EventEntity>> getTrendingEvents();
  Future<List<EventEntity>> getNearbyEvents();
  Future<BannerEntity> getFeaturedBanner();
  Future<List<EventEntity>> searchEvents(String query);
  Future<bool> toggleFavourite(int eventId);
}
