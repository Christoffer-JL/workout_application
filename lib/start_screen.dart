import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF98FFAE),
      appBar: AppBar(
        title: const Text('Startskärm'),
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(80.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/new_workout');
            },
            style: ElevatedButton.styleFrom(fixedSize: const Size(1500, 50)),
            child: const Text('Lägg till nytt pass'),
          ),
        )
      ]),
    );
  }
}
