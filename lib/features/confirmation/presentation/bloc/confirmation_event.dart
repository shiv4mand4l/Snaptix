abstract class ConfirmationEvent {
  const ConfirmationEvent();
}

class LoadBookingDetails extends ConfirmationEvent {}

class ViewTicketsPressed extends ConfirmationEvent {}

class AddToWalletPressed extends ConfirmationEvent {}

class AddToCalendarPressed extends ConfirmationEvent {}

class SharePressed extends ConfirmationEvent {}

class ReturnToHomePressed extends ConfirmationEvent {}
