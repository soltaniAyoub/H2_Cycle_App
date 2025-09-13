import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'routes.dart';
import 'theme.dart';
import 'app_state.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const H2CycleApp(),
    ),
  );
}

class H2CycleApp extends StatefulWidget {
  const H2CycleApp({super.key});

  @override
  State<H2CycleApp> createState() => _H2CycleAppState();
}

class _H2CycleAppState extends State<H2CycleApp> {
  @override
  void initState() {
    super.initState(); // ✅ doit être au début
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'H₂Cycle',
      theme: buildTheme(),
      routerConfig: appRouter, // ✅ défini dans routes.dart
      debugShowCheckedModeBanner: false,
    );
  }
}
