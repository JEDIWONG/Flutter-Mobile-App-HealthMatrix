import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class HeartbeatRate extends StatelessWidget{
  const HeartbeatRate({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            BpmPicker(),
          ],
        ),
        
      ),
    );
    
  }
  
}

class BpmPicker extends StatefulWidget{
  const BpmPicker({super.key});

  @override
  State<BpmPicker> createState()=>BpmPickerState();

}

class BpmPickerState extends State<BpmPicker>{

  int curr_bpm=0;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.black,
      
      ),
      child: Column(
        children: [
          Row(
            children: [
              NumberPicker(
                textStyle: const TextStyle(color: Colors.lightGreenAccent),
                selectedTextStyle: const TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 32),
                value: curr_bpm,
                minValue: 90,
                maxValue: 200,
                onChanged: (value) => setState(() => curr_bpm = value),
              ),
              const Text("Bpm",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 14),),

            ],
          )
        ],
      ),
    );
  }

  
}