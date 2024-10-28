import 'package:flutter/material.dart';
import 'package:health_matrix/screen/steps_taken.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class Walks extends StatelessWidget{
  const Walks({super.key, required this.stepsNo, required this.stepsGoals});
  
  final int stepsNo; 
  final int stepsGoals;

  int getStepsLeft() {
    int stepsLeft = stepsGoals - stepsNo;
    return stepsLeft > 0 ? stepsLeft : 0;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const StepsTaken()));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 30,left: 10,right: 10,bottom: 10),
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 26, 26, 26),
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
              title:Text("Steps Todays",style: TextStyle(color: Color.fromARGB(255, 255, 145, 0),fontWeight: FontWeight.bold,fontSize: 24),),
              trailing: Icon(Icons.navigate_next_rounded,color: Color.fromARGB(255, 255, 145, 0),),
            ),

            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: CircularPercentIndicator(
                    startAngle: 220,
                    radius: 40.0,
                    lineWidth: 10.0,
                    percent: 1/8,
                    center: const Icon(Icons.directions_walk,color: Color.fromARGB(255, 255, 145, 0),),
                    backgroundColor: Colors.black,
                    progressColor: const Color.fromARGB(255, 255, 145, 0),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child:  Row(
                    children: [
                      Text("$stepsNo",style: const TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.orange)),
                      const SizedBox(width: 5,),
                      const Text("steps /",style: TextStyle(fontSize: 12,color: Colors.white,fontStyle: FontStyle.italic)), 
                      const SizedBox(width: 5,),
                      Text("$stepsGoals",style: const TextStyle(fontSize: 20,color: Colors.orange,fontStyle: FontStyle.italic))
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${getStepsLeft()}", style: const TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.bold)),
                const SizedBox(width: 5,),
                const Text("Steps Left", style:  TextStyle(color: Colors.orange, fontSize: 12)),
                Container(
                  width: MediaQuery.sizeOf(context).width/3,
                  margin: const EdgeInsets.only(top: 5,left: 10),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Center(
                    child: Text("Keep It Up !",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  
}