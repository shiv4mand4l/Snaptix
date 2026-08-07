import 'package:flutter_task/features/explore/domain/entities/nearby_event_entities.dart';

import '../repository/explore_repositories.dart';

class GetNearbyEventsUseCase {
  final ExploreRepository repository;

  GetNearbyEventsUseCase(this.repository);

  Future<List<NearbyEventEntity>> call() async {
    return await repository.getNearbyEvents();
  }
}
