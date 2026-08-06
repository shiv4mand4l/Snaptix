import 'package:flutter_task/features/tickets/domain/entities/ticket_entities.dart';

import '../repository/ticket_repository.dart';

class GetTicketsUsecase {
  final TicketRepository ticketRepository;

  GetTicketsUsecase(this.ticketRepository);

  Future<List<TicketEntities>> call() {
    return ticketRepository.getTickets();
  }
}
