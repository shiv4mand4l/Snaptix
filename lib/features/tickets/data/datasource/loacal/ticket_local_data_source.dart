import '../../../presentation/widgets/ticket_status.dart';
import '../../models/ticket_model.dart';

abstract class TicketLocalDataSource {
  Future<List<TicketModel>> getTickets();
}

class TicketLocalDataSourceImpl implements TicketLocalDataSource {
  @override
  Future<List<TicketModel>> getTickets() async {
    await Future.delayed(const Duration(milliseconds: 600));

    return const [
      // Card 1
      TicketModel(
        title: 'Neon Nights Festival',
        dateDay: '24',
        dateMonth: 'AUG',
        dateTimeString: 'Sat, 20:00 PM',
        venue: 'Skyline Arena',
        ticketId: '#PX-9920',
        imageUrl: 'assets/images/Neon Nights Festival.jpg',
        status: TicketStatus.liveSoon,
      ),

      // Card 2
      TicketModel(
        title: 'Food Carnival',
        dateDay: '02',
        dateMonth: 'SEP',
        dateTimeString: 'Sun, 11:00 AM',
        venue: 'City Park',
        ticketId: '#PX-5521',
        imageUrl: 'assets/images/Food Carnival.jpg',
        status: TicketStatus.confirmed,
      ),

      // Card 3
      TicketModel(
        title: 'Tech Expo 2024',
        dateDay: '18',
        dateMonth: 'SEP',
        dateTimeString: 'Wed, 10:00 AM',
        venue: 'Convention Center',
        ticketId: '#PX-8812',
        imageUrl: 'assets/images/Tech Expo 2024.jpg',
        status: TicketStatus.confirmed,
      ),

      // Card 4
      TicketModel(
        title: 'Indie Rock Concert',
        dateDay: '29',
        dateMonth: 'SEP',
        dateTimeString: 'Fri, 19:30 PM',
        venue: 'Grand Theater',
        ticketId: '#PX-3341',
        imageUrl: 'assets/images/Indie Rock Concert.jpg',
        status: TicketStatus.liveSoon,
      ),

      // Card 5 (Completed - Appears in PAST tab)
      TicketModel(
        title: 'Tech Meetup',
        dateDay: '11',
        dateMonth: 'SEP',
        dateTimeString: 'Fri, 03:00 PM',
        venue: 'Innovation Hub',
        ticketId: '#PX-7771',
        imageUrl: 'assets/images/Tech Meetup.jpg',
        status: TicketStatus.completed,
      ),

      // Card 6 (Completed - Appears in PAST tab)
      TicketModel(
        title: 'Summer EDM Night',
        dateDay: '05',
        dateMonth: 'AUG',
        dateTimeString: 'Sat, 21:00 PM',
        venue: 'Beach Resort Arena',
        ticketId: '#PX-1102',
        imageUrl: 'assets/images/Summer EDM Night.jpg',
        status: TicketStatus.completed,
      ),
    ];
  }
}
