import 'package:flutter_task/features/explore/data/models/nearby_events_model.dart';

import '../../models/banner_model.dart';
import '../../models/category_model.dart';
import '../../models/event_model.dart';

abstract class ExploreLocalDataSource {
  Future<List<CategoryModel>> fetchCategories();
  Future<List<EventModel>> fetchTrendingEvents();
  Future<List<NearbyEventModel>> fetchNearbyEvents();
  Future<BannerModel> fetchFeaturedBanner();
  Future<List<EventModel>> searchEvents(String query);
  Future<bool> toggleFavourite(int eventId);
}

class ExploreLocalDataSourceImpl implements ExploreLocalDataSource {
  // Mock API Implementation
  @override
  Future<List<CategoryModel>> fetchCategories() async {
    // await Future.delayed(const Duration(milliseconds: 300));
    return const [
      CategoryModel(id: 0, title: 'All', iconName: 'flash_on'),
      CategoryModel(id: 1, title: 'Music', iconName: 'music_note'),
      CategoryModel(id: 2, title: 'Tech', iconName: 'desktop_windows'),
      CategoryModel(id: 3, title: 'Sports', iconName: 'sports_basketball'),
    ];
  }

  @override
  Future<List<EventModel>> fetchTrendingEvents() async {
    // await Future.delayed(const Duration(milliseconds: 300));
    return const [
      EventModel(
        id: 101,
        title: 'Neon Horizon Festival',
        category: 'Concert',
        date: 'DEC 24, 2026',
        time: '11:00 PM',
        location: 'The Kathmandu District, KTM',
        price: 49.00,
        imageUrl: 'assets/images/Neon Horizon Festival.jpg',
        isTrending: true,
      ),
      EventModel(
        id: 102,
        title: 'Cultural Event',
        category: 'Cultural Music',
        date: 'OCT 14, 2020',
        time: '05:00 PM',
        location: 'The Biratnagar City, BRT',
        price: 56.00,
        imageUrl: 'assets/images/Cultural Event.jpg',
        isTrending: false,
      ),
      EventModel(
        id: 103,
        title: 'Cozy Modern Party',
        category: 'Music Festival',
        date: 'OCT 23, 2025',
        time: '07:00 PM',
        location: 'The Kathmandu District, KTM',
        price: 49.00,
        imageUrl: 'assets/images/Cozy Modern Party.jpg',
        isTrending: true,
      ),
      EventModel(
        id: 104,
        title: 'Late Night Event',
        category: 'Concert & Musuc',
        date: 'APR 14, 2022',
        time: '01:00 AM',
        location: 'The Janakur District, JNP',
        price: 61.00,
        imageUrl: 'assets/images/Late Night Event.jpg',
        isTrending: true,
      ),
      EventModel(
        id: 105,
        title: 'Midnight Jazz Sessions',
        category: 'Music & Dance',
        date: 'JAN 24, 2023',
        time: '12:00 PM',
        location: 'The Warehouse District, NY',
        price: 89.00,
        imageUrl: 'assets/images/Midnight Jazz Sessions.jpg',
        isTrending: false,
      ),
    ];
  }

  @override
  Future<List<NearbyEventModel>> fetchNearbyEvents() async {
    // await Future.delayed(const Duration(milliseconds: 300));
    return const [
      NearbyEventModel(
        id: 201,
        title: 'Tech Innovators Meetup',
        category: 'Food',
        date: 'Today',
        time: '12:00 PM',
        location: '1.2 miles away',
        price: 25.00,
        imageUrl: 'assets/images/Tech Innovators Meetup.jpg',
      ),

      NearbyEventModel(
        id: 202,
        title: 'Brooklyn Food Expo',
        category: 'Technology',
        date: 'Tomorrow',
        time: '6:30 PM',
        location: '2.5 miles away',
        price: 40.00,
        imageUrl: 'assets/images/Booklyn Food Expo.jpg',
      ),

      NearbyEventModel(
        id: 203,
        title: 'Summer Music Festival',
        category: 'Music',
        date: 'OCT 18, 2026',
        time: '7:00 PM',
        location: '3.1 miles away',
        price: 65.00,
        imageUrl: 'assets/images/Summer Music Festival.jpg',
      ),

      NearbyEventModel(
        id: 204,
        title: 'City Hackathon Championship',
        category: 'Sports',
        date: 'OCT 22, 2026',
        time: '4:00 PM',
        location: '4.2 miles away',
        price: 30.00,
        imageUrl: 'assets/images/City HackthonChampionship.jpg',
      ),

      NearbyEventModel(
        id: 205,
        title: 'Creative Design Workshop',
        category: 'Design',
        date: 'OCT 25, 2026',
        time: '10:00 AM',
        location: '5.6 miles away',
        price: 20.00,
        imageUrl: 'assets/images/Creative Design Workshop.jpg',
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
