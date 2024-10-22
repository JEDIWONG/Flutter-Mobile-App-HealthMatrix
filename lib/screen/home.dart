import 'package:flutter/material.dart';
import 'package:health_matrix/component/exercise.dart';
import 'package:health_matrix/component/health_monitor.dart';

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
  
    return const Scaffold(
      
      body: Column(
        children: [
          HealthMonitor(),
          Exercise()
        ],
      ),
    );
  }
  
}