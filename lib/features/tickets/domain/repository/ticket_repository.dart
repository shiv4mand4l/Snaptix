import 'package:flutter_task/features/tickets/domain/entities/ticket_entities.dart';

abstract class TicketRepository {
  Future<List<TicketEntities>> getTickets();
}
