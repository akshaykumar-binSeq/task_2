import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'core/failures.dart';
import 'core/value_objects.dart';
part 'ticket.freezed.dart';

@freezed
abstract class Ticket implements _$Ticket {
  const Ticket._();

  const factory Ticket({
    required String id,
    required TicketTitle title,
    required Description description,
    required StringSingleLine location,
    required DateToday createdAt,
    required String attachment,
  }) = _Ticket;

  factory Ticket.empty() => Ticket(
      id: '',
      title: TicketTitle(''),
      description: Description(''),
      location: StringSingleLine(''),
      createdAt: DateToday(DateTime.now().toIso8601String()),
      attachment: '');

  Option<ValueFailure<dynamic>> get failureOption {
    return title.value
        .fold((f) => some(f), (_) => none())
        .flatMap((_) => description.value.fold((f) => some(f), (_) => none()))
        .flatMap((_) => location.value.fold((f) => some(f), (_) => none()))
        .flatMap((_) => createdAt.value.fold((f) => some(f), (_) => none()));
  }
}
