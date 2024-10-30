import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WaterIntake extends StatefulWidget {
  const WaterIntake({super.key});

  @override
  State<WaterIntake> createState() => _WaterIntakeState();
}

class _WaterIntakeState extends State<WaterIntake> {
  int _cupsQuantity = 1;
  int _cupSize = 100; // Default cup size in ml
  int _eachDrink = 100; // Default each drink volume in ml
  double _currentIntake = 0; // Current water intake
  double _goalIntake = 1000; // Default water goal (calculated based on cup size * cups)
  int goalPercent = 0;

  @override
  void initState() {
    super.initState();
    calculateWaterGoals();
  }

  // Function to calculate the total water goals
  void calculateWaterGoals() {
    setState(() {
      _goalIntake = _cupsQuantity * _cupSize.toDouble();
    });
    getGoalPercent();
  }

  // Function to add water intake based on each drink size
  void addWaterIntake() {
    setState(() {
      _currentIntake += _eachDrink;
      if (_currentIntake > _goalIntake) {
        _currentIntake = _goalIntake; // Ensure we don't exceed the goal
      }
    });
    getGoalPercent();
  }

  void getGoalPercent(){
    setState(() {
      goalPercent = ((_currentIntake / _goalIntake)*100).toInt();
    });
  }

  String getSuggestion() {
    if (goalPercent < 50) {
      return "You are below 50% of your daily water goal. Keep drinking to stay hydrated!";
    } else if (goalPercent < 100) {
      return "You are on track! Just a bit more to meet your daily goal!";
    } else {
      return "Great job! You've reached your daily water intake goal!";
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentIntake / _goalIntake).clamp(0.0, 1.0); // Clamp to ensure progress is between 0 and 1

    return Scaffold(
      appBar: AppBar(
        title: const Text("Water Intake Log",
        style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black,
        foregroundColor: Colors.blue,
        actions: const [
          Icon(Icons.bar_chart_rounded),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: const BoxDecoration(color: Colors.black),
              child: Column(
                children: [
                  CircularPercentIndicator(
                    startAngle: 220,
                    radius: 80.0,
                    lineWidth: 20.0,
                    percent: progress, // Set the progress dynamically
                    center:  Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.water_drop_rounded,
                            color: Colors.blue,
                            size:  50,
                          ),
                          Text("$goalPercent %",style: const TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    footer: const Text("Daily Water Intake",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),
                    backgroundColor: const Color.fromARGB(255, 52, 52, 52),
                    progressColor: Colors.blue,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                        onPressed: () {
                          addWaterIntake(); // Add water intake when button is pressed
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                        ),
                        child: const Text(
                          "Drink",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        )),

                  ),
                  // New section for suggestions
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      getSuggestion(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            buildSetting(context),
          ],
        ),
      ),
    );
  }

  Widget buildSetting(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          const Text(
            "Water Intake Setting",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 20),

          // Row for Each Drink Selection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Each Drink (ml)",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              DropdownButton<int>(
                value: _eachDrink,
                style: const TextStyle(color: Colors.white),
                items: const [
                  DropdownMenuItem(value: 50, child: Text("50 ml")),
                  DropdownMenuItem(value: 100, child: Text("100 ml")),
                  DropdownMenuItem(value: 150, child: Text("150 ml")),
                  DropdownMenuItem(value: 200, child: Text("200 ml")),
                  DropdownMenuItem(value: 300, child: Text("300 ml")),
                ],
                onChanged: (value) {
                  setState(() {
                    _eachDrink = value!;
                  });
                },
                dropdownColor: Colors.blue,
                
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Row for Cup Size Selection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Cup Size (ml)",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              DropdownButton<int>(
                value: _cupSize,
                style: const TextStyle(color: Colors.white),
                items: const [
                  DropdownMenuItem(value: 100, child: Text("100 ml")),
                  DropdownMenuItem(value: 200, child: Text("200 ml")),
                  DropdownMenuItem(value: 300, child: Text("300 ml")),
                  DropdownMenuItem(value: 400, child: Text("400 ml")),
                  DropdownMenuItem(value: 500, child: Text("500 ml")),
                ],
                onChanged: (value) {
                  setState(() {
                    _cupSize = value!;
                    calculateWaterGoals(); // Recalculate goal when cup size changes
                  });
                },
                dropdownColor: Colors.blue,
              ),
            ],
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Cups Numbers ",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (_cupsQuantity > 1) {
                      _cupsQuantity--;
                      calculateWaterGoals();
                    }
                  });
                },
              ),
              Text(
                '$_cupsQuantity Cups',
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    _cupsQuantity++;
                    calculateWaterGoals();
                  });
                },
              ),
            ],
          ),

          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Daily Water Goals",
                  style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Text(
                    "$_goalIntake ml", // Display the calculated goal intake
                    style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
