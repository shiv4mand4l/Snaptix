import '../entities/event_entity.dart';
import '../repository/explore_repositories.dart';

class GetTrendingEventsUseCase {
  final ExploreRepository repository;

  GetTrendingEventsUseCase(this.repository);

  Future<List<EventEntity>> call() async {
    return await repository.getTrendingEvents();
  }
}
