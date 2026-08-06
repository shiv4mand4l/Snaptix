import '../../presentation/widgets/ticket_status.dart';

class TicketEntities {
  final String title;
  final String dateDay;
  final String dateMonth;
  final String dateTimeString;
  final String venue;
  final String ticketId;
  final String imageUrl;
  final TicketStatus status;

  const TicketEntities({
    required this.title,
    required this.dateDay,
    required this.dateMonth,
    required this.dateTimeString,
    required this.venue,
    required this.ticketId,
    required this.imageUrl,
    required this.status,
  });
}
