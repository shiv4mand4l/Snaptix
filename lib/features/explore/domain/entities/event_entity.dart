// domain/entities/event_entity.dart
import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  final int id;
  final String title;
  final String category;
  final String date;
  final String time;
  final String location;
  final double price;
  final String imageUrl;
  final bool isFavourite;
  final bool isTrending;

  const EventEntity({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.time,
    required this.location,
    required this.price,
    required this.imageUrl,
    this.isFavourite = false,
    this.isTrending = false,
  });

  EventEntity copyWith({bool? isFavourite}) {
    return EventEntity(
      id: id,
      title: title,
      category: category,
      date: date,
      time: time,
      location: location,
      price: price,
      imageUrl: imageUrl,
      isFavourite: isFavourite ?? this.isFavourite,
      isTrending: isTrending,
    );
  }

  @override
  List<Object> get props => [
    id,
    title,
    category,
    date,
    time,
    location,
    price,
    imageUrl,
    isFavourite,
    isTrending,
  ];
}
