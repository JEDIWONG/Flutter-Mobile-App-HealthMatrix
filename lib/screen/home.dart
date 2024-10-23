import 'package:flutter/material.dart';
import 'package:health_matrix/component/bp.dart';
import 'package:health_matrix/component/exercise.dart';
import 'package:health_matrix/component/health_monitor.dart';
import 'package:health_matrix/component/heart_beat.dart';
import 'package:health_matrix/component/hydration.dart';
import 'package:health_matrix/component/walks.dart';


class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
  
    return const Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            HealthMonitor(),
            Exercise(currKcal: 150, goalKcal: 200, currTime: 12, goalTime: 24),
            Walks(stepsNo: 3000,stepsGoals: 8000,),
            Hydration(currMl: 1000,goalMl: 3700,),
            Bp(sys: 101, dia: 59),
            HeartBeat(bpm: 89),
          ],
        ),                                                  
      )
    );
  }
  
}