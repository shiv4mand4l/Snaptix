import '../../domain/entities/event_detail.dart';
import '../../domain/entities/organizer.dart';
import '../../domain/entities/similar_event.dart';
import '../../domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  @override
  Future<EventDetail> getEventDetail(String eventId) async {
    // In a real app, this calls RemoteDataSource (API via Dio/Http) or LocalDataSource (Hive/SQLite)
    await Future.delayed(const Duration(milliseconds: 600));

    return const EventDetail(
      id: 'neon-2024',
      title: 'Neon Horizons: The 2024 Global Tour',
      bannerImageUrl: 'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7',
      badgeText: 'SOLD OUT SOON',
      dateTimeText: 'Saturday, June 15 • 7:30 PM',
      monthText: 'JUN',
      dayText: '15',
      dateTitle: 'Saturday, 7:30 PM',
      dateSubtitle: 'Doors open at 6:00 PM',
      locationTitle: 'The Grand Arena Plaza',
      locationSubtitle: 'Los Angeles, CA',
      aboutDescription:
          'Experience the sonic revolution as Neon Horizons brings their highly anticipated 2024 Global Tour to Los Angeles. Witness a spectacular fusion of synth-wave melodies, state-of-the-art visual projection mapping, and the raw energy that has made them a household name in modern tech-pop.',
      priceText: '\$89.00',
      isFavorite: false,
      organizer: Organizer(
        id: 'snaptix-1',
        name: 'Snaptix Events Group',
        logoUrl: 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe',
        rating: 4.9,
        reviewsCount: '1.2k Reviews',
        isFollowing: false,
      ),
      similarEvents: [
        SimilarEvent(
          id: '1',
          imageUrl: 'https://images.unsplash.com/photo-1511192336575-5a79af67a629',
          category: 'JAZZ & SOUL',
          title: 'Midnight Blue Sessions',
          dateAndLocation: 'Jun 20 • Hollywood',
          isFavorite: false,
        ),
        SimilarEvent(
          id: '2',
          imageUrl: 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745',
          category: 'TECH MUSIC',
          title: 'Digital Horizons Fest',
          dateAndLocation: 'Jun 25 • LA Stage',
          isFavorite: true,
        ),
      ],
    );
  }

  @override
  Future<bool> toggleFavorite(String eventId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  Future<bool> toggleFollowOrganizer(String organizerId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }
}
