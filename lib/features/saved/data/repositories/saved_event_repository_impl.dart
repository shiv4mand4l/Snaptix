// import '../../domain/entities/saved_event_entities.dart';
// import '../../domain/repositories/event_repository.dart';
// import '../datasources/local/saved_event_local_data_source.dart';

// class SavedEventRepositoryImpl implements SavedEventRepository {
//   final SavedEventLocalDataSource local;

//   SavedEventRepositoryImpl(this.local);

//   @override
//   Future<List<SavedEventEntities>> getSavedEvents() {
//     return local.getSavedEvents();
//   }

//   @override
//   Future<void> toggleSavedEvent(String id) {
//     return local.toggleSaved(id);
//   }
// }

import '../../domain/entities/saved_event_entities.dart';
import '../../domain/repositories/saved_event_repository.dart';
import '../datasources/local/saved_event_local_data_source.dart';

class SavedEventRepositoryImpl implements SavedEventRepository {
  final SavedEventLocalDataSource localDataSource;

  SavedEventRepositoryImpl(this.localDataSource);

  @override
  Future<List<SavedEventEntity>> getSavedEvents() async {
    return await localDataSource.getSavedEvents();
  }

  @override
  Future<void> toggleSavedEvent(String id) {
    return localDataSource.toggleSavedEvent(id);
  }
}
