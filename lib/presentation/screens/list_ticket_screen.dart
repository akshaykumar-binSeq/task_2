import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_2/application/ticket_provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ticket.title.getOrElse(''),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              ticket.createdAt.getOrElse('').split('T').first,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        ticket.description.getOrElse(''),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),

                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Location: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              ticket.location.getOrElse('').split('T').first,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                      if (ticket.attachment != '') ...[
                        const SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          onTap: () async {
                            if (!await launchUrl(
                                Uri.parse(ticket.attachment))) {
                              throw Exception(
                                  'Could not launch ${ticket.attachment}');
                            }
                          },
                          child: const Text(
                            'Click to show or download Atachment',
                            style: TextStyle(fontSize: 14, color: Colors.blue),
                          ),
                        )
                      ]

                      // Add more details using additional Text, Row, or other widgets
                      // ...
                    ],
                  ),
                ),
              );
            },
          );
  }
}
