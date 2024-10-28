import 'package:flutter/material.dart';
import 'package:health_matrix/screen/water_intake.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Hydration extends StatelessWidget{
  const Hydration({super.key, required this.currMl, required this.goalMl});

  final int currMl; 
  final int goalMl;


  int getWaterLeft(){
    int waterLeft = goalMl - currMl;

    return waterLeft;
  }

  int getCup(int ml) {
    double cup = ml / 240;
    return cup.floor();
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const WaterIntake()));},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 50,horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              blurStyle: BlurStyle.normal,
              color: Color.fromARGB(255, 49, 49, 49),
              offset: Offset(0, 1),
            )
          ]
        ),
        child: Column(
          children: [
            const ListTile(
              title: Text("Water Intake",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 24),),
              trailing: Icon(Icons.navigate_next_rounded,color: Colors.blue,),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  startAngle: 220,
                  radius: 40.0,
                  lineWidth: 10.0,
                  percent: 1000/3700, // Set the progress dynamically
                  center:  const Icon(
                          Icons.water_drop_rounded,
                          color: Colors.blue,
                        ),
                  backgroundColor: const Color.fromARGB(255, 52, 52, 52),
                  progressColor: Colors.blue,
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 0),
                      child:  Row(
                        children: [
                          Text("$currMl",style: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.blue)),
                          const SizedBox(width: 5,),
                          const Text("ml /",style: TextStyle(fontSize: 12,color: Colors.white,fontStyle: FontStyle.italic)), 
                          const SizedBox(width: 5,),
                          Text("$goalMl",style: const TextStyle(fontSize: 20,color: Colors.blue,fontStyle: FontStyle.italic))
                        ],
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 0),
                      child: Row(
                        children: [
                          Text("${getCup(currMl)}",style: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.blue)),
                          const SizedBox(width: 5,),
                          const Text("Cups /",style: TextStyle(fontSize: 12,color: Colors.white,fontStyle: FontStyle.italic)), 
                          const SizedBox(width: 5,),
                          Text("${getCup(goalMl)}",style: const TextStyle(fontSize: 20,color: Colors.blue,fontStyle: FontStyle.italic))
                        ],
                      ),
                    ), 
                  
                  ],
                )
            ],),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${getWaterLeft()}",style: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                const SizedBox(width: 5,),
                const Text("ml Left", style: TextStyle(color: Colors.orange, fontSize: 12)),
                
                Container(
                  width: MediaQuery.sizeOf(context).width/3,
                  margin: const EdgeInsets.only(top: 5,left: 10),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Center(
                    child: Text("Good Luck!",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  
}