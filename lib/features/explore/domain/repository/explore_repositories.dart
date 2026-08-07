import 'package:flutter_task/features/explore/domain/entities/nearby_event_entities.dart';

import '../entities/category_entities.dart';
import '../entities/event_entity.dart';
import '../entities/banner_entity.dart';

abstract class ExploreRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<List<EventEntity>> getTrendingEvents();
  Future<List<NearbyEventEntity>> getNearbyEvents();
  Future<BannerEntity> getFeaturedBanner();
  Future<List<EventEntity>> searchEvents(String query);
  Future<bool> toggleFavourite(int eventId);
}
