import 'package:flutter/material.dart';
import 'package:workout/widgets/workout_insert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewWorkout extends StatefulWidget {
  const NewWorkout({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewWorkoutState createState() => _NewWorkoutState();
}

class _NewWorkoutState extends State<NewWorkout> {
  bool schedule = true;
  static const double paddingBetweenItems = 20.0;
  String squatsPastValues = "Loading...";
  String benchPressPastValues = "Loading...";
  String barbellBentPastValues = "Loading...";
  String tricepsValues = "Loading...";
  String barbellMilitaryPastValues = "Loading...";
  String deadliftPastValues = "Loading...";
  String chinPastValues = "Loading...";

  Future<void> fetchDataAndBuild() async {
    String squatsData = (await fetchWeightData("Squats")).toString();
    String benchpressData = (await fetchWeightData("Bench press")).toString();
    String barbellBentData =
        (await fetchWeightData("Barbell bent over row")).toString();
    String tricepsData = (await fetchWeightData("Triceps dips")).toString();
    String barbellMilitaryData =
        (await fetchWeightData("Barbell military press")).toString();
    String deadliftData = (await fetchWeightData("Deadlift")).toString();
    String chinData = (await fetchWeightData("Chin up")).toString();
    schedule = await getSchedule();

    setState(() {
      squatsPastValues = squatsData;
      benchPressPastValues = benchpressData;
      barbellBentPastValues = barbellBentData;
      tricepsValues = tricepsData;
      barbellMilitaryPastValues = barbellMilitaryData;
      deadliftPastValues = deadliftData;
      chinPastValues = chinData;
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchDataAndBuild();

    return Scaffold(
      backgroundColor: const Color(0xFF98FFAE),
      appBar: AppBar(
        title: const Text('Nytt pass'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WorkoutInsert(workoutName: "Squats", pastValues: squatsPastValues),
            const SizedBox(height: paddingBetweenItems),
            WorkoutInsert(
                workoutName:
                    schedule ? "Bench press" : "Barbell military press",
                pastValues: schedule
                    ? benchPressPastValues
                    : barbellMilitaryPastValues),
            const SizedBox(height: paddingBetweenItems),
            WorkoutInsert(
                workoutName: schedule ? "Barbell bent over row" : "Deadlift",
                pastValues:
                    schedule ? barbellBentPastValues : deadliftPastValues),
            const SizedBox(height: paddingBetweenItems),
            WorkoutInsert(
                workoutName: schedule ? "Triceps dips" : "Chin up",
                weights: false,
                pastValues: schedule ? tricepsValues : chinPastValues),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  updateSchedule();
                });
              },
              child: const Text('Byt schema'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<int> fetchWeightData(String workoutName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? value = prefs.getInt(workoutName);
  return value ?? 0;
}

void updateSchedule() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("schedule", !(await getSchedule()));
}

Future<bool> getSchedule() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? schedule = prefs.getBool("schedule");
  return schedule ?? true;
}
