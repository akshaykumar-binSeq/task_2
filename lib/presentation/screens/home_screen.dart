import 'package:flutter/material.dart';

import 'create_ticket_screen.dart';
import 'list_ticket_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const TicketScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateTicketScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
