import '../../domain/entities/event_detail.dart';
import 'organizer_model.dart';
import 'similar_event_model.dart';

class EventDetailModel extends EventDetail {
  const EventDetailModel({
    required super.id,
    required super.bannerImageUrl,
    required super.badgeText,
    required super.title,
    required super.dateTimeText,
    required super.monthText,
    required super.dayText,
    required super.dateTitle,
    required super.dateSubtitle,
    required super.locationTitle,
    required super.locationSubtitle,
    required super.aboutDescription,
    required OrganizerModel super.organizer,
    required List<SimilarEventModel> super.similarEvents,
    required super.priceText,
    required super.isFavorite,
  });

  factory EventDetailModel.fromJson(Map<String, dynamic> json) {
    return EventDetailModel(
      id: json['id'],
      bannerImageUrl: json['bannerImageUrl'],
      badgeText: json['badgeText'],
      title: json['title'],
      dateTimeText: json['dateTimeText'],
      monthText: json['monthText'],
      dayText: json['dayText'],
      dateTitle: json['dateTitle'],
      dateSubtitle: json['dateSubtitle'],
      locationTitle: json['locationTitle'],
      locationSubtitle: json['locationSubtitle'],
      aboutDescription: json['aboutDescription'],
      organizer: OrganizerModel.fromJson(json['organizer']),
      similarEvents: (json['similarEvents'] as List)
          .map((e) => SimilarEventModel.fromJson(e))
          .toList(),
      priceText: json['priceText'],
      isFavorite: json['isFavorite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bannerImageUrl': bannerImageUrl,
      'badgeText': badgeText,
      'title': title,
      'dateTimeText': dateTimeText,
      'monthText': monthText,
      'dayText': dayText,
      'dateTitle': dateTitle,
      'dateSubtitle': dateSubtitle,
      'locationTitle': locationTitle,
      'locationSubtitle': locationSubtitle,
      'aboutDescription': aboutDescription,
      'organizer': (organizer as OrganizerModel).toJson(),
      'similarEvents': (similarEvents as List<SimilarEventModel>)
          .map((e) => e.toJson())
          .toList(),
      'priceText': priceText,
      'isFavorite': isFavorite,
    };
  }

  factory EventDetailModel.fromEntity(EventDetail event) {
    return EventDetailModel(
      id: event.id,
      bannerImageUrl: event.bannerImageUrl,
      badgeText: event.badgeText,
      title: event.title,
      dateTimeText: event.dateTimeText,
      monthText: event.monthText,
      dayText: event.dayText,
      dateTitle: event.dateTitle,
      dateSubtitle: event.dateSubtitle,
      locationTitle: event.locationTitle,
      locationSubtitle: event.locationSubtitle,
      aboutDescription: event.aboutDescription,
      organizer: OrganizerModel.fromEntity(event.organizer),
      similarEvents: event.similarEvents
          .map((e) => SimilarEventModel.fromEntity(e))
          .toList(),
      priceText: event.priceText,
      isFavorite: event.isFavorite,
    );
  }
}
