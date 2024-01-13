import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';
import 'package:task_2/domain/core/app_failures.dart';
import 'package:task_2/domain/ticket.dart';
import 'package:task_2/domain/i_ticket_repository.dart';
import 'package:task_2/push_notification/i_notification_repository.dart';
import 'package:task_2/push_notification/notification_repository.dart';

import '../infrastructure/ticket_repository.dart';
import 'ticket_state.dart';

class TicketProvider extends StateNotifier<TicketState> {
  final ITicketRepository _repository;
  final INotificationRepository _notificationRepository;

  TicketProvider(this._repository, this._notificationRepository)
      : super(const TicketState.initial());

  Future<void> _performAction(
      Future<Either<AppFailures, Unit>> Function() action) async {
    state = const TicketState.loading();
    final result = await action();
    state = result.fold(
      (failure) => TicketState.failure(failure),
      (_) => const TicketState.actionSuccess(),
    );
  }

  Future<void> createTicket(Ticket ticket, File? attachment) async {
    state = const TicketState.showError(true);
    ticket.title.isValid();
    ticket.description.isValid();
    ticket.location.isValid();
    ticket.createdAt.isValid();
    if (ticket.title.isValid() &&
        ticket.description.isValid() &&
        ticket.location.isValid() &&
        ticket.createdAt.isValid()) {
      await _performAction(() => _repository.createTicket(ticket, attachment));
    } else {}
  }

  Future<void> deleteTicket(String ticketId) async {
    await _performAction(() => _repository.deleteTicket(ticketId));
  }

  Future<void> fetchTickets() async {
    state = const TicketState.loading();
    final result = await _repository.fetchTickets();
    state = result.fold(
      (failure) => TicketState.failure(failure),
      (tickets) => TicketState.loaded(tickets),
    );
  }

  Future<void> setPushNotification() async {
    String getPlatformName(TargetPlatform platform) {
      switch (platform) {
        case TargetPlatform.android:
          return 'android';
        case TargetPlatform.iOS:
          return 'ios';
        default:
          return 'Unknown';
      }
    }

    await _notificationRepository
        .registerDeviceNotification(getPlatformName(defaultTargetPlatform));
  }
}

final ticketProvider = StateNotifierProvider<TicketProvider, TicketState>(
  (ref) => TicketProvider(TicketRepository(), NotificationRepository()),
);
