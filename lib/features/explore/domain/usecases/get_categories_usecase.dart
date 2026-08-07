import '../entities/category_entities.dart';
import '../repository/explore_repositories.dart';

class GetCategoriesUseCase {
  final ExploreRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<CategoryEntity>> call() async {
    return await repository.getCategories();
  }
}
