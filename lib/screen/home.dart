import 'package:flutter/material.dart';
import 'package:health_matrix/component/bp.dart';
import 'package:health_matrix/component/exercise.dart';
import 'package:health_matrix/component/health_monitor.dart';
import 'package:health_matrix/component/heart_beat.dart';
import 'package:health_matrix/component/hydration.dart';
import 'package:health_matrix/component/walks.dart';
import 'package:health_matrix/model/data.dart';


class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white, 
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HealthMonitor(),
            Walks(stepsNo: AppData.userSteps.currentSteps,stepsGoals: AppData.userSteps.goalSteps,),
            Hydration(currMl: AppData.userWater.currentMl,goalMl: AppData.userWater.goalMl,),
            const Exercise(currKcal: 150, goalKcal: 200, currTime: 12, goalTime: 24),
            const Bp(sys: 101, dia: 59),
            const HeartBeat(bpm: 60),
          ],
        ),                                                  
      )
    );
  }
  
}