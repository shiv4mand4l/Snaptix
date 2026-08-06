part of 'tickets_bloc.dart';

sealed class TicketsEvent extends Equatable {
  const TicketsEvent();

  @override
  List<Object> get props => [];
}

class OnLoadTickets extends TicketsEvent {}

class FilterTickets extends TicketsEvent {
  final bool upcoming;

  const FilterTickets(this.upcoming);

  @override
  List<Object> get props => [upcoming];
}
