import '../entities/event_detail.dart';
import '../repositories/event_repository.dart';

class GetEventDetailUseCase {
  final EventRepository repository;

  GetEventDetailUseCase(this.repository);

  Future<EventDetail> call(String eventId) async {
    return await repository.getEventDetail(eventId);
  }
}
