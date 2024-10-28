import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BloodPressure extends StatelessWidget {
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

class BpNumberWheel extends StatefulWidget {
  const BpNumberWheel({super.key});

  @override
  State<BpNumberWheel> createState() => _BpNumberWheelState();
}

class _BpNumberWheelState extends State<BpNumberWheel> {
  int _currentSys = 100;
  int _currentDia = 80; 

  String getSysMessage() {
    if (_currentSys < 120) return "Normal";
    if (_currentSys < 130) return "Elevated";
    if (_currentSys < 140) return "High (Hypertension Stage 1)";
    if (_currentSys < 180) return "High (Hypertension Stage 2)";
    return "Hypertensive Crisis";
  }

  String getDiaMessage() {
    if (_currentDia < 80) return "Normal";
    if (_currentDia < 90) return "High (Hypertension Stage 1)";
    if (_currentDia < 120) return "High (Hypertension Stage 2)";
    return "Hypertensive Crisis";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NumberPicker(
                      textStyle: const TextStyle(color: Colors.lightGreenAccent),
                      selectedTextStyle: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 32),
                      value: _currentSys,
                      minValue: 90,
                      maxValue: 200,
                      onChanged: (value) => setState(() => _currentSys = value),
                    ),
                    const Text(" Systolic", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 14)),
                    SizedBox(width: 20),
                    NumberPicker(
                      textStyle: const TextStyle(color: Colors.lightGreenAccent),
                      selectedTextStyle: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 32),
                      value: _currentDia,
                      minValue: 60,
                      maxValue: 120,
                      onChanged: (value) => setState(() => _currentDia = value),
                    ),
                    const Text(" Diastolic", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 14)),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 100, top: 30),
                  child: Row(
                    children: [
                      Text("$_currentSys/$_currentDia", style: const TextStyle(fontSize: 32, color: Colors.amber, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 5),
                      const Text("mmHg", style: TextStyle(color: Colors.lightGreenAccent, fontSize: 14)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    ),
                    child: const Text("Record", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.black,
            ),
            child: Column(
              children: [
                _buildGauge(
                  title: 'Systolic',
                  value: _currentSys.toDouble(),
                  minValue: 90,
                  maxValue: 200,
                  ranges:  [
                    GaugeRange(startValue: 90, endValue: 120, color: Colors.green, startWidth: 30, endWidth: 30),
                    GaugeRange(startValue: 120, endValue: 130, color: Colors.yellow, startWidth: 30, endWidth: 30),
                    GaugeRange(startValue: 130, endValue: 140, color: Colors.orange, startWidth: 30, endWidth: 30),
                    GaugeRange(startValue: 140, endValue: 180, color: Colors.deepOrange, startWidth: 30, endWidth: 30),
                    GaugeRange(startValue: 180, endValue: 200, color: Colors.red, startWidth: 30, endWidth: 30),
                  ],
                  message: getSysMessage(),
                ),
                _buildGauge(
                  title: 'Diastolic',
                  value: _currentDia.toDouble(),
                  minValue: 60,
                  maxValue: 120,
                  ranges:  [
                    GaugeRange(startValue: 60, endValue: 80, color: Colors.green, startWidth: 30, endWidth: 30),
                    GaugeRange(startValue: 80, endValue: 90, color: Colors.orange, startWidth: 30, endWidth: 30),
                    GaugeRange(startValue: 90, endValue: 120, color: Colors.red, startWidth: 30, endWidth: 30),
                  ],
                  message: getDiaMessage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGauge({
    required String title,
    required double value,
    required double minValue,
    required double maxValue,
    required List<GaugeRange> ranges,
    required String message,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      height: 200,
      child: SfRadialGauge(
        title: GaugeTitle(
          text: title,
          textStyle: const TextStyle(color: Colors.amber, fontSize: 20, fontStyle: FontStyle.italic),
        ),
        axes: <RadialAxis>[
          RadialAxis(
            minimum: minValue,
            maximum: maxValue,
            showLabels: false,
            ranges: ranges,
            pointers: <GaugePointer>[NeedlePointer(value: value)],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: message.contains("Normal") ? Colors.green : message.contains("Elevated") ? Colors.yellow : Colors.red,
                    ),
                  ),
                ),
                angle: 90,
                positionFactor: 0.5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
