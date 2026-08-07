import 'package:equatable/equatable.dart';

class SavedEventEntity extends Equatable {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final String dates;
  final String time;
  final String location;
  final double price;
  final bool isTrending;
  final bool isSaved;
  final int attendeesCount;

  const SavedEventEntity({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.dates,
    required this.time,
    required this.location,
    required this.price,
    required this.isTrending,
    required this.isSaved,
    required this.attendeesCount,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    category,
    imageUrl,
    dates,
    time,
    location,
    price,
    isTrending,
    isSaved,
    attendeesCount,
  ];
}
