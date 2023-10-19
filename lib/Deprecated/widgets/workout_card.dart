import 'package:flutter/material.dart';
import 'package:workout/workout_detail.dart';
import 'package:workout/workout_screen.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Workout - Day X',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            WorkoutDetailButton(
              buttonText: 'Add new workout',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddWorkoutScreen()),
                );
              },
            ),
            const SizedBox(height: 10),
            WorkoutDetailButton(
              buttonText: 'View workout information',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WorkoutDetailScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutDetailButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const WorkoutDetailButton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
