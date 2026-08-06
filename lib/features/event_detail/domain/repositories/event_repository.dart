import '../entities/event_detail.dart';

abstract class EventRepository {
  Future<EventDetail> getEventDetail(String eventId);
  Future<bool> toggleFavorite(String eventId);
  Future<bool> toggleFollowOrganizer(String organizerId);
}
