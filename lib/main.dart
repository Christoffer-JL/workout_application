import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'new_workout.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Träningsapp',
      initialRoute: '/',
      routes: {
        '/': (context) => const StartScreen(),
        '/new_workout': (context) => NewWorkout(),
      },
    );
  }
}
