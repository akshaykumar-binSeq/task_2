import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:task_2/domain/core/app_failures.dart';
import 'package:task_2/domain/i_ticket_repository.dart';
import 'package:task_2/domain/ticket.dart';
import 'package:task_2/infrastructure/ticket_dto.dart';

class TicketRepository implements ITicketRepository {
  late CollectionReference _ticketsCollection;

  TicketRepository() {
    _ticketsCollection = FirebaseFirestore.instance.collection('tickets');
  }

  @override
  Future<Either<AppFailures, Unit>> createTicket(Ticket ticket) async {
    try {
      final habitDto = TicketDto.fromDomain(ticket);

      await _ticketsCollection
          .doc('user_id')
          .collection('my_tickets')
          .add(habitDto.toJson());
      return right(unit);
    } catch (e) {
      return handleException(e);
    }
  }

  @override
  Future<Either<AppFailures, Unit>> deleteTicket(String ticketId) async {
    try {
      await _ticketsCollection
          .doc('user_id')
          .collection('my_tickets')
          .doc(ticketId)
          .delete();
      return right(unit);
    } catch (e) {
      return handleException(e);
    }
  }

  @override
  Future<Either<AppFailures, List<Ticket>>> fetchTickets() async {
    try {
      final ticketsSnapshot = await _ticketsCollection.get();
      final tickets = ticketsSnapshot.docs
          .map((doc) => TicketDto.fromFirestore(doc).toDomain())
          .toList();
      return right(tickets);
    } catch (e) {
      return handleException(e);
    }
  }
}
