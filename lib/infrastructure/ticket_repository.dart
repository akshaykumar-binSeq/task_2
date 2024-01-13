import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:task_2/domain/core/app_failures.dart';
import 'package:task_2/domain/i_ticket_repository.dart';
import 'package:task_2/domain/ticket.dart';
import 'package:task_2/infrastructure/ticket_dto.dart';
import 'package:task_2/push_notification/i_notification_repository.dart';
import 'package:task_2/push_notification/notification_repository.dart';

class TicketRepository implements ITicketRepository {
  late CollectionReference _ticketsCollection;
  INotificationRepository notificationRepository = NotificationRepository();

  TicketRepository() {
    _ticketsCollection = FirebaseFirestore.instance.collection('tickets');
  }

  @override
  Future<Either<AppFailures, Unit>> createTicket(
      Ticket ticket, File? attachment) async {
    try {
      TicketDto ticketDto = TicketDto.fromDomain(ticket);

      if (attachment != null) {
        final Reference storageRef = FirebaseStorage.instance.ref().child(
            'attachments/user_id/${ticket.createdAt.value.getOrElse(() => '')}');
        final UploadTask uploadTask = storageRef.putFile(attachment);
        final TaskSnapshot storageSnapshot = await uploadTask;

        // Get the download URL of the uploaded photo
        final String attachmentURL = await storageSnapshot.ref.getDownloadURL();
        ticketDto =
            TicketDto.fromDomain(ticket.copyWith(attachment: attachmentURL));
      }

      await _ticketsCollection
          .doc('user_id')
          .collection('my_tickets')
          .add(ticketDto.toJson());
      try {
        notificationRepository.sendFCMMessage('Ticket Created',
            'New Ticket has be created with title ${ticket.title.value.getOrElse(() => '')}');
      } catch (e) {
        null;
      }
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
      final ticketsSnapshot = await _ticketsCollection
          .doc('user_id')
          .collection('my_tickets')
          .get();
      final tickets = ticketsSnapshot.docs
          .map((doc) => TicketDto.fromFirestore(doc).toDomain())
          .toList();

      return right(tickets);
    } catch (e) {
      return handleException(e);
    }
  }
}
