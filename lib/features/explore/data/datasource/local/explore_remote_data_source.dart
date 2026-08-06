import 'package:flutter_task/core/constants/app_images.dart';

import '../../models/banner_model.dart';
import '../../models/category_model.dart';
import '../../models/event_model.dart';

abstract class ExploreRemoteDataSource {
  Future<List<CategoryModel>> fetchCategories();
  Future<List<EventModel>> fetchTrendingEvents();
  Future<List<EventModel>> fetchNearbyEvents();
  Future<BannerModel> fetchFeaturedBanner();
  Future<List<EventModel>> searchEvents(String query);
  Future<bool> toggleFavourite(int eventId);
}

class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource {
  // Mock API Implementation
  @override
  Future<List<CategoryModel>> fetchCategories() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return const [
      CategoryModel(id: 0, title: 'All', iconName: 'flash_on'),
      CategoryModel(id: 1, title: 'Music', iconName: 'music_note'),
      CategoryModel(id: 2, title: 'Tech', iconName: 'desktop_windows'),
      CategoryModel(id: 3, title: 'Sports', iconName: 'sports_basketball'),
    ];
  }

  @override
  Future<List<EventModel>> fetchTrendingEvents() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return const [
      EventModel(
        id: 101,
        title: 'Neon Snaptix: Underground Rave',
        category: 'Music',
        date: 'OCT 24, 2024',
        time: '8:00 PM',
        location: 'The Warehouse District, NY',
        price: 89.00,
        imageUrl: AppImages.dance,
        isTrending: true,
      ),
    ];
  }

  @override
  Future<List<EventModel>> fetchNearbyEvents() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return const [
      EventModel(
        id: 201,
        title: 'Brooklyn Food Expo',
        category: 'Food',
        date: 'Today',
        time: '12:00 PM',
        location: '1.2 miles away',
        price: 25.00,
        imageUrl: AppImages.concert,
      ),
    ];
  }

  @override
  Future<BannerModel> fetchFeaturedBanner() async {
    return const BannerModel(
      id: 1,
      title: 'Host Your Own Event',
      description:
          'Reach thousands of event-goers and manage your bookings seamlessly.',
      buttonText: 'Create Event',
    );
  }

  @override
  Future<List<EventModel>> searchEvents(String query) async {
    final all = await fetchTrendingEvents();
    return all
        .where((e) => e.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Future<bool> toggleFavourite(int eventId) async {
    return true;
  }
}
