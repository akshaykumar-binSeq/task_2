import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_2/firebase_options.dart';

import 'presentation/screens/home_screen.dart';
import 'push_notification/messaging_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Future.delayed(const Duration(seconds: 2)).then(
    (value) =>
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
            .then((_) => runApp(const MainApp())),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final messagingService = MessagingService();

  @override
  void initState() {
    super.initState();
    messagingService.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
