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
    await Future.delayed(const Duration(milliseconds: 600));

    return const EventDetailModel(
      id: '1',
      bannerImageUrl: 'assets/images/Indie Rock Concert.jpg',
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
          'Experience an unforgettable live concert featuring top international artists. Enjoy incredible music, stunning performances, and an electrifying atmosphere.',
      priceText: '\$89',
      isFavorite: false,
      venueName: 'Gairi Gau - 32',
      organizer: OrganizerModel(
        logoUrl: 'assets/images/profile.png',
        name: 'Live Nation',
        rating: 4.9,
        reviewsCount: '1250',
        isFollowing: false,
        id: '',
      ),
      similarEvents: [
        SimilarEventModel(
          id: '2',
          imageUrl: 'assets/images/Agile & Scrum Essentials.jpg',
          category: 'TECH',
          title: 'Future Tech Summit',
          dateAndLocation: 'August 14 • Boston',
          isFavorite: false,
        ),

        SimilarEventModel(
          id: '3',
          imageUrl: 'assets/images/Booklyn Food Expo.jpg',
          category: 'FOOD',
          title: 'Taste of the City',
          dateAndLocation: 'September 2 • Chicago',
          isFavorite: true,
        ),

        SimilarEventModel(
          id: '4',
          imageUrl: 'assets/images/Neon Horizon Festival.jpg',
          category: 'MUSIC',
          title: 'Neon Horizon Festival',
          dateAndLocation: 'September 18 • Miami',
          isFavorite: false,
        ),

        SimilarEventModel(
          id: '5',
          imageUrl: 'assets/images/Tech Meetup.jpg',
          category: 'SPORTS',
          title: 'Urban Sports Weekend',
          dateAndLocation: 'October 7 • Seattle',
          isFavorite: true,
        ),

        SimilarEventModel(
          id: '6',
          imageUrl: 'assets/images/Booklyn Food Expo.jpg',
          category: 'ART',
          title: 'Modern Art Showcase',
          dateAndLocation: 'October 21 • San Francisco',
          isFavorite: false,
        ),
      ],
    );
  }

  @override
  Future<List<EventDetailModel>> getAllEvents() async {
    return [await getEventDetail("1")];
  }
}
