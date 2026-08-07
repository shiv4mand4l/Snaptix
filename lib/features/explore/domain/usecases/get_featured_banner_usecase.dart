import '../entities/banner_entity.dart';
import '../repository/explore_repositories.dart';

class GetFeaturedBannerUseCase {
  final ExploreRepository repository;

  GetFeaturedBannerUseCase(this.repository);

  Future<BannerEntity> call() async {
    return await repository.getFeaturedBanner();
  }
}
