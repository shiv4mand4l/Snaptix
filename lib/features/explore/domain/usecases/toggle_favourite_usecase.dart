// domain/usecases/toggle_favourite_usecase.dart
import '../repository/explore_repositories.dart';

class ToggleFavouriteUseCase {
  final ExploreRepository repository;

  ToggleFavouriteUseCase(this.repository);

  Future<bool> call(int eventId) async {
    return await repository.toggleFavourite(eventId);
  }
}
