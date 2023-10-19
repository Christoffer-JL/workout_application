import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout/widgets/exercise.dart';
import 'package:workout/widgets/workout_data.dart';

class AddWorkoutScreen extends StatelessWidget {
  const AddWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WorkoutForm(),
    );
  }
}

class WorkoutForm extends StatefulWidget {
  const WorkoutForm({super.key});

  @override
  _WorkoutFormState createState() => _WorkoutFormState();
}

class _WorkoutFormState extends State<WorkoutForm> {
  final TextEditingController weightController = TextEditingController();
  bool state = true;

  @override
  void dispose() {
    weightController.dispose();
    super.dispose();
  }

  void _addExercise(WorkoutData workoutData) {
    final exerciseName = weightController.text;
    if (exerciseName.isNotEmpty) {
      workoutData.addExercise(
          Exercise(name: exerciseName, lastWeight: 1, currentWeight: 5));
      weightController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final workoutData = Provider.of<WorkoutData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Text and Text Field Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text('Text to the left:'),
                SizedBox(width: 10), // Add some spacing
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter text',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), // Add vertical spacing
            const Row(
              children: [
                Icon(Icons.insert_drive_file), // You can use any widget here
                SizedBox(width: 10), // Add some spacing
                Text('Insert Field'),
              ],
            ),
            const SizedBox(height: 20), // Add vertical spacing
            ElevatedButton(
              onPressed: () {
                // Add your button click logic here
              },
              child: const Text('Click Me'),
            ),
          ],
        ),
      ),
    );
  }
}
