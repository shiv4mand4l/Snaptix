import '../../domain/entities/organizer.dart';

class OrganizerModel extends Organizer {
  const OrganizerModel({
    required super.logoUrl,
    required super.name,
    required super.rating,
    required super.reviewsCount,
    required super.isFollowing,
    required super.id,
  });

  factory OrganizerModel.fromJson(Map<String, dynamic> json) {
    return OrganizerModel(
      logoUrl: json['logoUrl'],
      name: json['name'],
      rating: json['rating'].toDouble(),
      reviewsCount: json['reviewsCount'],
      isFollowing: json['isFollowing'],
      id: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'logoUrl': logoUrl,
      'name': name,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'isFollowing': isFollowing,
    };
  }

  factory OrganizerModel.fromEntity(Organizer organizer) {
    return OrganizerModel(
      logoUrl: organizer.logoUrl,
      name: organizer.name,
      rating: organizer.rating,
      reviewsCount: organizer.reviewsCount,
      isFollowing: organizer.isFollowing,
      id: '',
    );
  }
}
