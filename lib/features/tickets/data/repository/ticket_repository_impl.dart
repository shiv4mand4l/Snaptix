import 'package:flutter_task/features/tickets/domain/entities/ticket_entities.dart';

import '../../domain/repository/ticket_repository.dart';
import '../datasource/loacal/ticket_local_data_source.dart';

class TicketRepositoryImpl implements TicketRepository {
  final TicketLocalDataSource localDataSource;

  TicketRepositoryImpl(this.localDataSource);

  @override
  Future<List<TicketEntities>> getTickets() {
    return localDataSource.getTickets();
  }
}
