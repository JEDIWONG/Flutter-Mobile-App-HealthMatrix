import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:health_matrix/model/data.dart';

class StepsTaken extends StatefulWidget {
  const StepsTaken({super.key});

  @override
  _StepsTakenState createState() => _StepsTakenState();
}

class _StepsTakenState extends State<StepsTaken> {
  late Stream<StepCount> _stepCountStream;
  String _steps = '0';
  int _initialSteps = 0;
  int _currentSteps = 0;
  int _todaySteps = AppData.userSteps.currentSteps;
  double goalPercent = 0;
  int _selectedGoal = AppData.userSteps.goalSteps;

  @override
  void initState() {
    super.initState();
    _checkPermissionsAndStartListening();
    setGoalPercent();
  }

  Future<void> _checkPermissionsAndStartListening() async {
    if (await Permission.activityRecognition.isGranted ||
        await Permission.activityRecognition.request().isGranted) {
      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError((error) {
        setState(() => _steps = 'Error: $error');
      });
    } else {
      setState(() => _steps = 'Permission Denied');
    }
  }

  void onStepCount(StepCount event) {
    setState(() {
      _initialSteps = event.steps;
      _currentSteps = event.steps - _initialSteps;
      _todaySteps += 10;
      _steps = _todaySteps.toString();
      setGoalPercent();
    });
  }

  void setGoalPercent(){
    setState(() {
      goalPercent = _todaySteps / _selectedGoal;
    });
  }

  void _updateGoalSteps(int newGoal) {
    setState(() {
      _selectedGoal = newGoal;
      AppData.userSteps.goalSteps = newGoal;  // Update goal steps in AppData
      setGoalPercent(); // Recalculate goal percentage
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Steps Taken")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                children: [
                  CircularPercentIndicator(
                    startAngle: 220,
                    radius: 80.0,
                    lineWidth: 20.0,
                    percent: goalPercent,
                    center: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.directions_walk_rounded,
                            color: Colors.deepOrangeAccent,
                            size: 50,
                          ),
                          Text(
                            "${(goalPercent * 100).toInt()} %",
                            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    footer: const Text("Daily Steps Taken", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                    backgroundColor: const Color.fromARGB(255, 52, 52, 52),
                    progressColor: Colors.deepOrange,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                    child: Row(
                      children: [
                        const Text("Step Today", style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold)),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          margin: const EdgeInsets.only(left: 10),
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text(_steps, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const Text("Goals", style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(width: 50,),
                        DropdownButton<int>(
                          value: _selectedGoal,
                          menuWidth: 100,
                          menuMaxHeight: 300,
                          
                          iconEnabledColor: Colors.deepOrange,
                          style: const TextStyle(color: Colors.white),
                          items: const [
                            DropdownMenuItem(value: 1000, child: Text("1000")),
                            DropdownMenuItem(value: 2000, child: Text("2000")),
                            DropdownMenuItem(value: 3000, child: Text("3000")),
                            DropdownMenuItem(value: 4000, child: Text("4000")),
                            DropdownMenuItem(value: 5000, child: Text("5000")),
                            DropdownMenuItem(value: 6000, child: Text("6000")),
                            DropdownMenuItem(value: 7000, child: Text("7000")),
                            DropdownMenuItem(value: 8000, child: Text("8000")),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedGoal = value!;
                              _updateGoalSteps(_selectedGoal);
                            });
                          },
                          dropdownColor: Colors.deepOrange,
                          
                        ),
                      ],
                    ),
                  )
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
