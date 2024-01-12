import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/core/value_objects.dart';
import '../domain/ticket.dart';

part 'ticket_dto.freezed.dart';
part 'ticket_dto.g.dart';

@freezed
abstract class TicketDto with _$TicketDto {
  const TicketDto._();
  const factory TicketDto({
    required String id,
    required String title,
    required String description,
    required String location,
    required String createdAt,
    required String attachment,
  }) = _TicketDto;

  factory TicketDto.fromJson(Map<String, dynamic> json) =>
      _$TicketDtoFromJson(json);

  factory TicketDto.fromDomain(Ticket ticket) {
    return TicketDto(
      id: '', // Empty string for now since Firebase will generate the ID
      title: ticket.title.getOrCrash(),
      description: ticket.description.getOrCrash(),
      location: ticket.location.getOrCrash(),
      createdAt: ticket.createdAt.getOrCrash(),
      attachment: ticket.attachment,
    );
  }

  factory TicketDto.fromFirestore(DocumentSnapshot doc) {
    return TicketDto.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }

  Ticket toDomain() {
    return Ticket(
      id: id,
      title: TicketTitle(title),
      description: Description(description),
      location: StringSingleLine(location),
      createdAt: DateToday(createdAt),
      attachment: attachment,
    );
  }
}
