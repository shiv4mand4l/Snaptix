import '../../models/event_detail_model.dart';
import '../../models/organizer_model.dart';
import '../../models/similar_event_model.dart';

abstract class EventLocalDataSource {
  Future<EventDetailModel> getEventDetail(String id);

  Future<List<EventDetailModel>> getAllEvents();
}

class EventLocalDataSourceImpl implements EventLocalDataSource {
  @override
  Future<EventDetailModel> getEventDetail(String id) async {
    await Future.delayed(const Duration(milliseconds: 700));

    return const EventDetailModel(
      id: '1',
      bannerImageUrl:
          'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7',
      badgeText: 'SOLD OUT SOON',
      title: 'Rock Music Festival',
      dateTimeText: '24 May • 8 PM',
      monthText: 'MAY',
      dayText: '24',
      dateTitle: 'Saturday Evening',
      dateSubtitle: '8:00 PM',
      locationTitle: 'Kathmandu Arena',
      locationSubtitle: 'Kathmandu',
      aboutDescription:
          'Experience one of the biggest live concerts featuring top international artists.',
      priceText: '\$89',
      isFavorite: false,
      organizer: OrganizerModel(
        logoUrl: 'https://images.unsplash.com/photo-1568602471122-7832951cc4c5',
        name: 'Live Nation',
        rating: 4.9,
        reviewsCount: '1250',
        isFollowing: false,
        id: '',
      ),
      similarEvents: [
        SimilarEventModel(
          id: '2',
          imageUrl:
              'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f',
          category: 'POP',
          title: 'Summer Beats',
          dateAndLocation: 'June 20 • LA',
          isFavorite: false,
        ),
        SimilarEventModel(
          id: '3',
          imageUrl:
              'https://images.unsplash.com/photo-1501386761578-eac5c94b800a',
          category: 'ROCK',
          title: 'Neon Night',
          dateAndLocation: 'July 5 • NY',
          isFavorite: true,
        ),
      ],
    );
  }

  @override
  Future<List<EventDetailModel>> getAllEvents() async {
    return [await getEventDetail("1")];
  }
}
