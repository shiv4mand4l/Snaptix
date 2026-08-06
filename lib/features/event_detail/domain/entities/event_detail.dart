import 'organizer.dart';
import 'similar_event.dart';

class EventDetail {
  final String id;
  final String title;
  final String bannerImageUrl;
  final String badgeText;
  final String dateTimeText;
  final String monthText;
  final String dayText;
  final String dateTitle;
  final String dateSubtitle;
  final String locationTitle;
  final String locationSubtitle;
  final String aboutDescription;
  final String priceText;
  final bool isFavorite;
  final Organizer organizer;
  final List<SimilarEvent> similarEvents;

  const EventDetail({
    required this.id,
    required this.title,
    required this.bannerImageUrl,
    required this.badgeText,
    required this.dateTimeText,
    required this.monthText,
    required this.dayText,
    required this.dateTitle,
    required this.dateSubtitle,
    required this.locationTitle,
    required this.locationSubtitle,
    required this.aboutDescription,
    required this.priceText,
    required this.isFavorite,
    required this.organizer,
    required this.similarEvents,
  });

  EventDetail copyWith({
    String? id,
    String? title,
    String? bannerImageUrl,
    String? badgeText,
    String? dateTimeText,
    String? monthText,
    String? dayText,
    String? dateTitle,
    String? dateSubtitle,
    String? locationTitle,
    String? locationSubtitle,
    String? aboutDescription,
    String? priceText,
    bool? isFavorite,
    Organizer? organizer,
    List<SimilarEvent>? similarEvents,
  }) {
    return EventDetail(
      id: id ?? this.id,
      title: title ?? this.title,
      bannerImageUrl: bannerImageUrl ?? this.bannerImageUrl,
      badgeText: badgeText ?? this.badgeText,
      dateTimeText: dateTimeText ?? this.dateTimeText,
      monthText: monthText ?? this.monthText,
      dayText: dayText ?? this.dayText,
      dateTitle: dateTitle ?? this.dateTitle,
      dateSubtitle: dateSubtitle ?? this.dateSubtitle,
      locationTitle: locationTitle ?? this.locationTitle,
      locationSubtitle: locationSubtitle ?? this.locationSubtitle,
      aboutDescription: aboutDescription ?? this.aboutDescription,
      priceText: priceText ?? this.priceText,
      isFavorite: isFavorite ?? this.isFavorite,
      organizer: organizer ?? this.organizer,
      similarEvents: similarEvents ?? this.similarEvents,
    );
  }
}
