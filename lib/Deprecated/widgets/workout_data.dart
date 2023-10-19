import 'package:flutter/foundation.dart';
import 'package:workout/widgets/exercise.dart';

class WorkoutData extends ChangeNotifier {
  List<Exercise> exercises = [];

  void updateWeight(int index, double weight) {
    exercises[index].lastWeight = exercises[index].currentWeight;
    exercises[index].currentWeight = weight;
    notifyListeners();
  }

  bool isExerciseIncluded(int index) {
    return exercises[index].currentWeight > 0;
  }

  void toggleExerciseInclusion(int index) {
    if (isExerciseIncluded(index)) {
      exercises[index].currentWeight = 0;
    } else {
      exercises[index].currentWeight = exercises[index].lastWeight;
    }
    notifyListeners();
  }

  void addExercise(Exercise exercise) {
    exercises.add(exercise);
  }
}
