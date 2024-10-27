import 'package:flutter/material.dart';
import 'package:health_matrix/component/number_wheel.dart';

class BloodPressure extends StatelessWidget{
  const BloodPressure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Blood Pressure"),),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            BpNumberWheel(),
            
          ],
        ),
      )
    );
  }
}