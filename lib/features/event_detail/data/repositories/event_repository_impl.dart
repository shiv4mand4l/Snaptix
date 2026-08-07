import '../../domain/entities/event_detail.dart';
import '../../domain/repositories/event_repository.dart';
import '../datasources/local/event_local_data_source.dart';

class EventRepositoryImpl implements EventRepository {
  final EventLocalDataSource localDataSource;

  EventRepositoryImpl(this.localDataSource);

  @override
  Future<EventDetail> getEventDetail(String eventId) async {
    final model = await localDataSource.getEventDetail(eventId);

    return model;
  }

  @override
  Future<bool> toggleFavorite(String eventId) async {
    // await Future.delayed(const Duration(milliseconds: 200));

    return true;
  }

  @override
  Future<bool> toggleFollowOrganizer(String organizerId) async {
    // await Future.delayed(const Duration(milliseconds: 200));

    return true;
  }
}
