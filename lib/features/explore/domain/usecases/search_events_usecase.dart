// domain/usecases/search_events_usecase.dart
import '../entities/event_entity.dart';
import '../repository/explore_repositories.dart';

class SearchEventsUseCase {
  final ExploreRepository repository;

  SearchEventsUseCase(this.repository);

  Future<List<EventEntity>> call(String query) async {
    return await repository.searchEvents(query);
  }
}
