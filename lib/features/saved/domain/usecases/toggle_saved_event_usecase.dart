import '../repositories/saved_event_repository.dart';

class ToggleSavedEventUsecase {
  final SavedEventRepository repository;

  ToggleSavedEventUsecase(this.repository);

  Future<void> call(String id) {
    return repository.toggleSavedEvent(id);
  }
}
