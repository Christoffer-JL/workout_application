import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout/widgets/workout_data.dart';

class ExerciseTile extends StatelessWidget {
  final int index;

  const ExerciseTile(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final exercise = Provider.of<WorkoutData>(context).exercises[index];

    return ListTile(
      title: Text(exercise.name),
      subtitle: Text('Last weight: ${exercise.lastWeight} kg'),
      trailing: SizedBox(
        width: 100,
        child: TextField(
          decoration: const InputDecoration(labelText: 'Current weight (kg)'),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            final weight = double.tryParse(value) ?? 0;
            Provider.of<WorkoutData>(context, listen: false)
                .updateWeight(index, weight);
          },
        ),
      ),
    );
  }
}
