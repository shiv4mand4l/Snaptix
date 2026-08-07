import '../../models/saved_event_model.dart';

abstract class SavedEventLocalDataSource {
  Future<List<SavedEventModel>> getSavedEvents();

  Future<void> toggleSavedEvent(String id);
}

class SavedEventLocalDataSourceImpl implements SavedEventLocalDataSource {
  final List<SavedEventModel> _events = [
    const SavedEventModel(
      id: '1',
      title: 'Neon Horizon Festival',
      category: 'Concerts',
      imageUrl: 'assets/images/Neon Horizon Festival.jpg',
      dates: 'Aug 14–16, 2024',
      time: '06:00 PM',
      location: 'Central Plaza',
      price: 89.00,
      isTrending: true,
      isSaved: true,
      attendeesCount: 45,
    ),
    const SavedEventModel(
      id: '2',
      title: 'UI/UX Masterclass 2024',
      category: 'Workshops',
      imageUrl: 'assets/images/UI-Ux.jpg',
      dates: 'Tomorrow',
      time: '10:00 AM',
      location: 'Tech Hub Downtown',
      price: 45.00,
      isTrending: false,
      isSaved: true,
      attendeesCount: 12,
    ),
    const SavedEventModel(
      id: '3',
      title: 'Midnight Jazz Sessions',
      category: 'Concerts',
      imageUrl: 'assets/images/Midnight Jazz Sessions.jpg',
      dates: 'Sat, Jul 20',
      time: '09:00 PM',
      location: 'Blue Note Lounge',
      price: 0.0,
      isTrending: false,
      isSaved: true,
      attendeesCount: 28,
    ),
    const SavedEventModel(
      id: '4',
      title: 'Creative Coding Workshop',
      category: 'Workshops',
      imageUrl: 'assets/images/Creative Coding Workshop.jpg',
      dates: 'Aug 22, 2024',
      time: '02:00 PM',
      location: 'Innovate Lab',
      price: 25.00,
      isTrending: false,
      isSaved: true,
      attendeesCount: 18,
    ),
    const SavedEventModel(
      id: '5',
      title: 'Rock the Park 2024',
      category: 'Concerts',
      imageUrl: 'assets/images/Rock the Park 2024.jpg',
      dates: 'Sep 05, 2024',
      time: '05:00 PM',
      location: 'City Amphitheater',
      price: 65.00,
      isTrending: true,
      isSaved: true,
      attendeesCount: 94,
    ),
    const SavedEventModel(
      id: '6',
      title: 'Product Design Sprint',
      category: 'Workshops',
      imageUrl: 'assets/images/Product Design Sprint.jpg',
      dates: 'Sep 12–14, 2024',
      time: '09:00 AM',
      location: 'Design Studio 101',
      price: 120.00,
      isTrending: false,
      isSaved: true,
      attendeesCount: 15,
    ),
    const SavedEventModel(
      id: '7',
      title: 'Acoustic Guitar Night',
      category: 'Concerts',
      imageUrl: 'assets/images/Acoustic Guitar Night.jpg',
      dates: 'Sep 18, 2024',
      time: '08:00 PM',
      location: 'The Coffee House',
      price: 15.00,
      isTrending: false,
      isSaved: true,
      attendeesCount: 22,
    ),
    const SavedEventModel(
      id: '8',
      title: 'Global Tech Conference',
      category: 'Workshops',
      imageUrl: 'assets/images/Global Tech Conference.jpg',
      dates: 'Oct 02–04, 2024',
      time: '08:00 AM',
      location: 'Convention Center',
      price: 299.00,
      isTrending: true,
      isSaved: true,
      attendeesCount: 150,
    ),
    const SavedEventModel(
      id: '9',
      title: 'Indie Pop Showcase',
      category: 'Concerts',
      imageUrl: 'assets/images/Indie Pop Showcase.jpg',
      dates: 'Oct 10, 2024',
      time: '07:30 PM',
      location: 'Underground Lounge',
      price: 20.00,
      isTrending: false,
      isSaved: true,
      attendeesCount: 37,
    ),
    const SavedEventModel(
      id: '10',
      title: 'Advanced Flutter Bootcamp',
      category: 'Workshops',
      imageUrl: 'assets/images/Advanced Flutter Bootcamp.jpg',
      dates: 'Oct 15–17, 2024',
      time: '10:00 AM',
      location: 'Online Workshop',
      price: 75.00,
      isTrending: true,
      isSaved: true,
      attendeesCount: 88,
    ),
    const SavedEventModel(
      id: '11',
      title: 'Symphony Under the Stars',
      category: 'Concerts',
      imageUrl: 'assets/images/Symphony Under the Stars.jpg',
      dates: 'Oct 24, 2024',
      time: '07:00 PM',
      location: 'Botanical Gardens',
      price: 50.00,
      isTrending: false,
      isSaved: true,
      attendeesCount: 64,
    ),
    const SavedEventModel(
      id: '12',
      title: 'Agile & Scrum Essentials',
      category: 'Workshops',
      imageUrl: 'assets/images/Agile & Scrum Essentials.jpg',
      dates: 'Nov 02, 2024',
      time: '09:00 AM',
      location: 'Corporate Suite B',
      price: 0.0,
      isTrending: false,
      isSaved: true,
      attendeesCount: 30,
    ),

    // Add the remaining events here...
  ];

  @override
  Future<List<SavedEventModel>> getSavedEvents() async {
    // await Future.delayed(const Duration(milliseconds: 500));

    return _events.where((event) => event.isSaved).toList();
  }

  @override
  Future<void> toggleSavedEvent(String id) async {
    final index = _events.indexWhere((e) => e.id == id);

    if (index == -1) return;

    final event = _events[index];

    _events[index] = event.copyWith(isSaved: !event.isSaved);
  }
}
