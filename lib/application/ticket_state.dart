import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_2/domain/core/app_failures.dart';
import 'package:task_2/domain/ticket.dart';

part 'ticket_state.freezed.dart';

@freezed
abstract class TicketState with _$TicketState {
  const factory TicketState.initial() = _Initial;
  const factory TicketState.loading() = _Loading;
  const factory TicketState.loaded(List<Ticket> tickets) = _Loaded;
  const factory TicketState.actionSuccess() = _ActionSuccess;
  const factory TicketState.failure(AppFailures failures) = _Failure;
  const factory TicketState.showError(bool showError) = _ShowError;
}
