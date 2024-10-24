import 'package:flutter/material.dart';
import 'package:health_matrix/component/number_wheel.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BloodPressure extends StatelessWidget{
  const BloodPressure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Blood Pressure"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BpNumberWheel(),
            
          ],
        ),
      )
    );
  }
}
