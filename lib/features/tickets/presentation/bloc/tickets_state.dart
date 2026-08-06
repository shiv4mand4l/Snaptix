part of 'tickets_bloc.dart';

sealed class TicketsState extends Equatable {
  const TicketsState();

  @override
  List<Object> get props => [];
}

final class TicketsInitial extends TicketsState {}

class TicketFiltering extends TicketsState {}

class TicketLoaded extends TicketsState {
  final List<TicketEntities> tickets;

  const TicketLoaded(this.tickets);

  @override
  List<Object> get props => [tickets];
}

class TicketError extends TicketsState {
  final String message;

  const TicketError({required this.message});

  @override
  List<Object> get props => [message];
}
