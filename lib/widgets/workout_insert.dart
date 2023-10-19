import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutInsert extends StatefulWidget {
  final String workoutName;
  final bool weights;
  final String pastValues;

  const WorkoutInsert({
    Key? key,
    required this.workoutName,
    this.weights = true,
    required this.pastValues,
  }) : super(key: key);

  @override
  _WorkoutInsertState createState() => _WorkoutInsertState();
}

class _WorkoutInsertState extends State<WorkoutInsert> {
  TextEditingController inputWeightsController = TextEditingController();

  @override
  void dispose() {
    inputWeightsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(widget.workoutName),
        ),
        Expanded(
          child: Text(
              (widget.weights ? 'Förra vikten: ' : 'Förra mängden reps: ') +
                  widget.pastValues),
        ),
        Expanded(
          child: Container(
            width: 150,
            padding: const EdgeInsets.only(right: 25),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: inputWeightsController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: widget.weights ? 'Vikt' : 'Reps',
              ),
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              saveWeightData(widget.workoutName, inputWeightsController.text);
            },
            child: const Text('Lägg till'),
          ),
        ),
      ],
    );
  }
}

void saveWeightData(String workoutName, String weight) async {
  print(workoutName);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(workoutName, int.tryParse(weight) ?? 0);
}
