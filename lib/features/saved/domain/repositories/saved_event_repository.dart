import '../entities/saved_event_entities.dart';

abstract class SavedEventRepository {
  Future<List<SavedEventEntity>> getSavedEvents();

  Future<void> toggleSavedEvent(String id);
}
