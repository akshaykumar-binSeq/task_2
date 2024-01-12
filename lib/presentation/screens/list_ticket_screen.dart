import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_2/application/ticket_provider.dart';

import '../../application/ticket_state.dart';
import '../../domain/ticket.dart';

class TicketScreen extends ConsumerStatefulWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  TicketScreenState createState() => TicketScreenState();
}

class TicketScreenState extends ConsumerState<TicketScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(ticketProvider.notifier).fetchTickets();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ticketState = ref.watch(ticketProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tickets'),
      ),
      body: _buildBody(context, ticketState),
    );
  }

  Widget _buildBody(BuildContext context, TicketState ticketState) {
    return ticketState.maybeMap(
      orElse: () => Container(),
      initial: (_) => const Center(child: Text('Initial State')),
      loading: (_) => const Center(child: CircularProgressIndicator()),
      loaded: (loaded) => _buildTicketList(loaded.tickets),
      failure: (failure) {
        // Handle failure, maybe show an error message
        return Center(child: Text('Error: ${failure.toString()}'));
      },
    );
  }

  Widget _buildTicketList(List<Ticket> tickets) {
    return tickets.isEmpty
        ? const Center(
            child: Text('No Tickets Created'),
          )
        : ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              final ticket = tickets[index];
              return Card(
                child: ListTile(
                  title: Text(ticket.title.getOrElse('')),
                  subtitle: Text(ticket.description.getOrElse('')),
                  // Add more details as needed
                  // ...
                ),
              );
            },
          );
  }
}
