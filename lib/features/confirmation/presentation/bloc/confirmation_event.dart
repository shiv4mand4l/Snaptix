abstract class ConfirmationEvent {
  const ConfirmationEvent();
}

class LoadBookingDetails extends ConfirmationEvent {
  const LoadBookingDetails();
}

class ViewTicketsPressed extends ConfirmationEvent {
  const ViewTicketsPressed();
}

class AddToWalletPressed extends ConfirmationEvent {
  const AddToWalletPressed();
}

class AddToCalendarPressed extends ConfirmationEvent {
  const AddToCalendarPressed();
}

class SharePressed extends ConfirmationEvent {
  const SharePressed();
}

class ReturnToHomePressed extends ConfirmationEvent {
  const ReturnToHomePressed();
}
