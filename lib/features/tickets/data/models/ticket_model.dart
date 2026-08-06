import 'package:flutter_task/features/tickets/domain/entities/ticket_entities.dart';

import '../../presentation/widgets/ticket_status.dart';

class TicketModel extends TicketEntities {
  const TicketModel({
    required super.title,
    required super.dateDay,
    required super.dateMonth,
    required super.dateTimeString,
    required super.venue,
    required super.ticketId,
    required super.imageUrl,
    required super.status,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      title: json['title'],
      dateDay: json['dateDay'],
      dateMonth: json['dateMonth'],
      dateTimeString: json['dateTimeString'],
      venue: json['venue'],
      ticketId: json['ticketId'],
      imageUrl: json['imageUrl'],
      status: TicketStatus.values.firstWhere((e) => e.name == json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'dateDay': dateDay,
      'dateMonth': dateMonth,
      'dateTimeString': dateTimeString,
      'venue': venue,
      'ticketId': ticketId,
      'imageUrl': imageUrl,
      'status': status.name,
    };
  }
}
