import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_2/presentation/widgets/create_ticket_form.dart';

import '../../application/ticket_provider.dart';
import 'home_screen.dart';

class CreateTicketScreen extends ConsumerStatefulWidget {
  const CreateTicketScreen({Key? key}) : super(key: key);

  @override
  CreateTicketScreenState createState() => CreateTicketScreenState();
}

class CreateTicketScreenState extends ConsumerState<CreateTicketScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen(ticketProvider.select((value) => value), ((previous, next) {
      next.whenOrNull(
          actionSuccess: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false, // This predicate will remove all routes
            );

            FlushbarHelper.createSuccess(message: 'Ticket Creation Success')
                .show(context);
          },
          failure: (_) => FlushbarHelper.createError(
              message: _.map(
                  unexpected: (_) => 'Unexpected Error',
                  insufficientPermission: (_) => 'Insufficient Permission',
                  firestoreFailure: (_) => 'Firestore Failure: ${_.message}',
                  networkFailure: (_) => 'Network Error')).show(context));
    }));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Ticket'),
        ),
        body: const CreateTicketForm());
  }
}
