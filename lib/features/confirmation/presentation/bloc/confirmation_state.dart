import '../../data/models/booking_confirmation_model.dart';

abstract class ConfirmationState {
  const ConfirmationState();
}

class ConfirmationInitial extends ConfirmationState {}

class ConfirmationLoading extends ConfirmationState {}

class ConfirmationLoaded extends ConfirmationState {
  final BookingConfirmationModel bookingDetails;
  const ConfirmationLoaded(this.bookingDetails);
}

class ConfirmationActionSuccess extends ConfirmationState {
  final String actionName;
  final BookingConfirmationModel bookingDetails;
  const ConfirmationActionSuccess(this.actionName, this.bookingDetails);
}
