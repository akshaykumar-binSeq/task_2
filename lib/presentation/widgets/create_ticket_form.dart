import 'dart:io';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/ticket_provider.dart';
import '../../domain/core/value_objects.dart';
import '../../domain/ticket.dart';

class CreateTicketForm extends ConsumerStatefulWidget {
  const CreateTicketForm({super.key});

  @override
  CreateTicketFormState createState() => CreateTicketFormState();
}

class CreateTicketFormState extends ConsumerState<CreateTicketForm> {
  Ticket ticket = Ticket.empty();
  File? file;

  @override
  Widget build(BuildContext context) {
    final ticketState = ref.watch(ticketProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        autovalidateMode: ticketState.maybeWhen(
          showError: (value) =>
              value ? AutovalidateMode.always : AutovalidateMode.disabled,
          orElse: () => AutovalidateMode.disabled,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  ticket = ticket.copyWith(title: TicketTitle(value));
                },
                validator: (value) {
                  return ticket.title.value.fold(
                    (f) => f.maybeMap(
                      exceedingLength: (_) => 'Invalid Length',
                      empty: (_) => 'Field Cannot be Empty',
                      orElse: () => null,
                    ),
                    (_) => null,
                  );
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  ticket = ticket.copyWith(description: Description(value));
                },
                validator: (value) {
                  return ticket.description.value.fold(
                    (f) => f.maybeMap(
                      exceedingLength: (_) => 'Invalid Length',
                      empty: (_) => 'Field Cannot be Empty',
                      orElse: () => null,
                    ),
                    (_) => null,
                  );
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Location'),
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  ticket = ticket.copyWith(location: StringSingleLine(value));
                },
                validator: (value) {
                  return ticket.location.value.fold(
                    (f) => f.maybeMap(
                      exceedingLength: (_) => 'Invalid Length',
                      empty: (_) => 'Field Cannot be Empty',
                      orElse: () => null,
                    ),
                    (_) => null,
                  );
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                enabled: false,
                controller: TextEditingController(
                    text: DateTime.now().toIso8601String().split('T').first),
                decoration: const InputDecoration(labelText: 'Date'),
              ),
              const SizedBox(height: 16.0),
              file != null
                  ? Row(
                      children: [
                        Text(
                          file!.path.split('/').last,
                        ),
                        IconButton(
                            onPressed: () {
                              file = null;

                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.red,
                            ))
                      ],
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          file = File(result.files.single.path!);
                          setState(() {});
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: const Text('Add Attachment'),
                    ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  FlushbarHelper.createLoading(
                          message: 'Uploading',
                          linearProgressIndicator: LinearProgressIndicator())
                      .show(context);
                  await ref
                      .read(ticketProvider.notifier)
                      .createTicket(ticket, file);
                },
                child: const Text('Create Ticket'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
