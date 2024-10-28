import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HeartbeatRate extends StatelessWidget {
  const HeartbeatRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.pinkAccent,
        title: const Text("Heart Beat Rate",style: TextStyle(color: Colors.pinkAccent),),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            BpmPicker(),
          ],
        ),
      ),
    );
  }
}

class BpmPicker extends StatefulWidget {
  const BpmPicker({super.key});

  @override
  State<BpmPicker> createState() => BpmPickerState();
}

class BpmPickerState extends State<BpmPicker> {
  int currBpm = 90;

  String getStatus() {
    if (currBpm < 60) return "Low";
    if (currBpm <= 100) return "Normal";
    return "High";
  }

  String getSuggestion() {
    if (currBpm < 60) {
      return "Your heart rate is lower than average. Consider consulting a healthcare provider.";
    } else if (currBpm <= 100) {
      return "Your heart rate is in a normal range. Keep up with a healthy lifestyle!";
    } else {
      return "Your heart rate is elevated. It might be beneficial to relax and reduce stress.";
    }
  }

  @override
  Widget build(BuildContext context) {
    String bpmStatus = getStatus();
    Color statusColor = (bpmStatus == "Low") ? Colors.blue : (bpmStatus == "Normal") ? Colors.green : Colors.red;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            children: [
              const Text(
                "Swipe Left or Right to Adjust Reading",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberPicker(
                    axis: Axis.horizontal,
                    textStyle: const TextStyle(color: Colors.amber),
                    selectedTextStyle: const TextStyle(
                      color: Color.fromARGB(255, 248, 152, 184),
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                    value: currBpm,
                    minValue: 30,
                    maxValue: 200,
                    onChanged: (value) => setState(() => currBpm = value),
                  ),
                  const Text(
                    "Bpm",
                    style: TextStyle(
                      color: Color.fromARGB(255, 248, 152, 184),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      width: 100,
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "$currBpm",
                            style: const TextStyle(
                              fontSize: 32,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            bpmStatus,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "Bpm",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(width: 35),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      ),
                      child: const Text(
                        "Record",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 50),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              const ListTile(
                
                title: Text("Range", style: TextStyle(color: Colors.amber,fontSize: 24,fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 30),
              SfLinearGauge(
                maximum: 200,
                showTicks: false,
                showAxisTrack: false,
                showLabels: false,
                labelOffset: 20,
                axisLabelStyle: const TextStyle(
                  color: Colors.amber,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                markerPointers: [
                  LinearShapePointer(
                    value: currBpm.toDouble(),
                    color: Colors.white,
                    shapeType: LinearShapePointerType.triangle,
                    position: LinearElementPosition.inside,
                  ),
                ],
                ranges: const [
                  LinearGaugeRange(
                    startValue: 30,
                    endValue: 60,
                    color: Colors.blue,
                    startWidth: 10,
                    endWidth: 10,
                  ),
                  LinearGaugeRange(
                    startValue: 60,
                    endValue: 100,
                    color: Colors.green,
                    startWidth: 10,
                    endWidth: 10,
                  ),
                  LinearGaugeRange(
                    startValue: 100,
                    endValue: 150,
                    color: Colors.red,
                    startWidth: 10,
                    endWidth: 10,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  bpmStatus,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30,left: 30,right: 30),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration:  BoxDecoration(
                  color: Colors.deepOrangeAccent.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Text(
                  getSuggestion(),
                  style: const TextStyle(color: Colors.amber, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
