import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BpNumberWheel extends StatefulWidget {
  const BpNumberWheel({super.key});

  @override
  State <BpNumberWheel> createState() => _BpNumberWheelState();
}

class _BpNumberWheelState extends State<BpNumberWheel> {
  int _currentSys = 100;
  int _currentDia = 80; 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.black,
            
            ),
            child: Column(
              children: [
                Row(
                  children:[
                    NumberPicker(
                      textStyle: const TextStyle(color: Colors.lightGreenAccent),
                      selectedTextStyle: const TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 32),
                      value: _currentSys,
                      minValue: 90,
                      maxValue: 200,
                      onChanged: (value) => setState(() => _currentSys = value),
                    ),
                    const Text("Systolic",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 14),),
                    NumberPicker(
                      textStyle: const TextStyle(color: Colors.lightGreenAccent),
                      selectedTextStyle: const TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 32),
                      value: _currentDia,
                      minValue: 60,
                      maxValue: 120,
                      onChanged: (value) => setState(() => _currentDia = value),
                    ),
                    const Text("Diastolic",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 14),),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 100,top: 30),
                  child: Row(
                    children: [
                      Text("$_currentSys/$_currentDia",style: const TextStyle(fontSize: 32,color: Colors.amber,fontWeight: FontWeight.bold),),
                      const SizedBox(width: 5,),
                      const Text("mmHg",style: TextStyle(color: Colors.lightGreenAccent,fontSize: 14),),
                    ],
                  ),              
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                    
                    ),
                    child: const Text("Record",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.black,
            ),
            
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  height: 200,
                  child: SfRadialGauge(
                    title: const GaugeTitle(text: 'Systolic',textStyle: TextStyle(color: Colors.amber,fontSize: 20,fontStyle: FontStyle.italic)),
                    axes: <RadialAxis>[
                      RadialAxis(minimum: 90, maximum: 200,
                        showLabels: false,
                        ranges: <GaugeRange>[
                          GaugeRange(startWidth: 30,endWidth: 30, startValue: 90, endValue: 120, color:Colors.green),
                          GaugeRange(startWidth: 30,endWidth: 30,startValue: 120,endValue: 130,color: Colors.yellow),
                          GaugeRange(startWidth: 30,endWidth: 30,startValue: 130,endValue: 140,color: Colors.orange),
                          GaugeRange(startWidth: 30,endWidth: 30,startValue: 140,endValue: 180,color: Colors.deepOrange),
                          GaugeRange(startWidth: 30,endWidth: 30, startValue: 180,endValue: 200,color: Colors.red),
                        ],

                        pointers: <GaugePointer>[NeedlePointer(value: _currentSys.toDouble())],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(widget: Container(child: 
                            Text('Normal',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green))),
                            angle: 90, positionFactor: 0.5
                          )
                        ]
                      )
                    ]
                  ),
                )
              ],
            ),
          )
          
        ],
      ),
    );
  }
}

class NumberWheel extends StatefulWidget {
  const NumberWheel({super.key});

  @override
  State <NumberWheel> createState() => _NumberWheelState();
}

class _NumberWheelState extends State<NumberWheel> {
  int _currentValue = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NumberPicker(
          value: _currentValue,
          minValue: 0,
          maxValue: 100,
          onChanged: (value) => setState(() => _currentValue = value),
        ),
        Text('Current value: $_currentValue'),
      ],
    );
  }
}

