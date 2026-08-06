// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_task/features/tickets/domain/entities/ticket_entities.dart';
import 'package:flutter_task/features/tickets/domain/usecases/get_tickets_usecase.dart';

import '../widgets/ticket_status.dart';

part 'tickets_event.dart';
part 'tickets_state.dart';

class TicketsBloc extends Bloc<TicketsEvent, TicketsState> {
  final GetTicketsUsecase getTicketsUsecase;
  TicketsBloc({required this.getTicketsUsecase}) : super(TicketsInitial()) {
    on<OnLoadTickets>(_onLoadTickets);
    on<FilterTickets>(_filterTickets);
  }

  Future<void> _onLoadTickets(
    OnLoadTickets event,
    Emitter<TicketsState> emit,
  ) async {
    emit(TicketFiltering());

    try {
      final tickets = await getTicketsUsecase();

      emit(TicketLoaded(tickets));
    } catch (e) {
      emit(TicketError(message: e.toString()));
    }
  }

  Future<void> _filterTickets(
    FilterTickets event,
    Emitter<TicketsState> emit,
  ) async {
    emit(TicketFiltering());

    try {
      final tickets = await getTicketsUsecase();

      final filtered = event.upcoming
          ? tickets.where((e) => e.status != TicketStatus.completed).toList()
          : tickets.where((e) => e.status == TicketStatus.completed).toList();

      emit(TicketLoaded(filtered));
    } catch (e) {
      emit(TicketError(message: e.toString()));
    }
  }
}
