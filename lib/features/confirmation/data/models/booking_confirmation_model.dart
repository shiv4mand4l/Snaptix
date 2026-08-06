class BookingConfirmationModel {
  final String eventName;
  final String ticketType;
  final String eventDate;
  final String eventTime;
  final String eventLocation;
  final String bookingId;
  final int ticketCount;
  final String qrData;
  final String confirmationMessage;
  const BookingConfirmationModel({
    required this.eventName,
    required this.ticketType,
    required this.eventDate,
    required this.eventTime,
    required this.eventLocation,
    required this.bookingId,
    required this.ticketCount,
    required this.qrData,
    required this.confirmationMessage,
  });
  factory BookingConfirmationModel.mock() {
    return const BookingConfirmationModel(
      eventName: 'Neon Snaptix Festival 2024',
      ticketType: 'GENERAL ADMISSION',
      eventDate: 'Fri, Aug 24, 2024',
      eventTime: '8:00 PM - 2:00 AM',
      eventLocation: 'Electric Warehouse, District 7',
      bookingId: 'NP-82390411',
      ticketCount: 2,
      qrData: 'Booking:NP-82390411|Tickets:2|Type:GA|Event:Neon-Snaptix-2024',
      confirmationMessage: 'Booking Confirmed • Check your email for receipt',
    );
  }
}
