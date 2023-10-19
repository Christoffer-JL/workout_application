import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout/widgets/workout_data.dart';
import 'package:workout/widgets/exercise_tile.dart';

class WorkoutDetailScreen extends StatelessWidget {
  const WorkoutDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout Details')),
      body: ListView.builder(
        itemCount: Provider.of<WorkoutData>(context).exercises.length,
        itemBuilder: (context, index) {
          return ExerciseTile(index);
        },
      ),
    );
  }
}
