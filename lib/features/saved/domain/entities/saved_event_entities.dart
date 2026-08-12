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

  final int catagoryId;

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
    required this.catagoryId,
  });

  SavedEventEntity copyWith({
    String? id,
    String? title,
    String? category,
    String? imageUrl,
    String? dates,
    String? time,
    String? location,
    double? price,
    bool? isTrending,
    bool? isSaved,
    int? attendeesCount,
  }) {
    return SavedEventEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      dates: dates ?? this.dates,
      time: time ?? this.time,
      location: location ?? this.location,
      price: price ?? this.price,
      isTrending: isTrending ?? this.isTrending,
      isSaved: isSaved ?? this.isSaved,
      attendeesCount: attendeesCount ?? this.attendeesCount,
      catagoryId: catagoryId,
    );
  }

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
    catagoryId,
  ];
}
