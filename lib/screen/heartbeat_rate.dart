import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HeartbeatRate extends StatelessWidget {
  const HeartbeatRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Heart Beat Rate"),
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

  String getStatus(){
    String status;

    if(currBpm<60){
      status = "Low";
    }
    if(currBpm>60&&currBpm<101){
      status = "Normal";
    }
    else{
      status="High";
    }
    return status;
  }

  @override
  Widget build(BuildContext context) {
    String bpmStatus;
    Color statusColor;

    // Determine the status and color based on the current BPM
    if (currBpm < 60) {
      bpmStatus = "Low";
      statusColor = Colors.blue;
    } else if (currBpm >= 60 && currBpm <= 100) {
      bpmStatus = "Normal";
      statusColor = Colors.green;
    } else {
      bpmStatus = "High";
      statusColor = Colors.red;
    }

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
          margin: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 50),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),

          child: Column(
            children: [
              ListTile(
                leading: Text("Details",style: TextStyle(fontSize: 32,color: Colors.pinkAccent),),
              ),
              SizedBox(height: 50,),
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
                    startWidth: 0,
                    endWidth: 20,
                  ),
                  LinearGaugeRange(
                    startValue: 60,
                    endValue: 100,
                    color: Colors.green,
                    startWidth: 20,
                    endWidth: 40,
                  ),
                  LinearGaugeRange(
                    startValue: 100,
                    endValue: 150,
                    color: Colors.red,
                    startWidth: 40,
                    endWidth: 60,
                  ),
                ],
              ),

              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(getStatus(),style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              ),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Everyting Is fine",style: TextStyle(color: Colors.amber),),
              )
              
            ],
          ),
        )
      ],
    );
  }
}
