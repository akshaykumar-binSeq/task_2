import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:task_2/domain/ticket.dart';

import 'core/app_failures.dart';

abstract class ITicketRepository {
  Future<Either<AppFailures, Unit>> createTicket(
      Ticket ticket, File? attachment);
  Future<Either<AppFailures, List<Ticket>>> fetchTickets();
  Future<Either<AppFailures, Unit>> deleteTicket(String ticketId);
}
