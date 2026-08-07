import '../entities/saved_event_entities.dart';
import '../repositories/saved_event_repository.dart';

class GetSavedEventsUsecase {
  final SavedEventRepository repository;

  GetSavedEventsUsecase(this.repository);

  Future<List<SavedEventEntity>> call() {
    return repository.getSavedEvents();
  }
}
