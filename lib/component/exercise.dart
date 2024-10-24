import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Exercise extends StatelessWidget{
  const Exercise({super.key, required this.currKcal, required this.goalKcal, required this.currTime, required this.goalTime});

  final int currKcal; 
  final int goalKcal;
  final int currTime;
  final int goalTime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){print("1");},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
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
              title:Text("Exercise",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
              trailing: Icon(Icons.navigate_next_rounded,color: Colors.white,),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child:  Row(
                children: [
                  Column(
                    children: [
                      
                      CircularPercentIndicator(
                        startAngle: 220,
                        radius: 60.0,
                        lineWidth: 5.0,
                        percent: 0.8,
                        center:Container(
                          margin: const EdgeInsets.only(top: 30),
                          child:  Column(
                            children: [
                              Text("$currKcal Kcal",style: const TextStyle(color: Colors.amber,fontSize: 22),),
                              Text("Of $goalKcal",style: const TextStyle(color: Colors.white,fontStyle: FontStyle.italic),), 
                            ],
                          ),
                        ),
                        backgroundColor: Colors.black,
                        progressColor: Colors.amber,
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)), 
                          color: Colors.amber,
                        ),
                        child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              Text("Calories Burn",style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          )
                        ),
                      ), 
                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(
                    children: [
                      CircularPercentIndicator(
                        startAngle: 220,
                        radius: 60.0,
                        lineWidth: 5.0,
                        percent: 0.8,
                        center:Container(
                          margin: const EdgeInsets.only(top: 30),
                          child:  Column(
                            children: [
                              Text("$currTime Hour",style: const TextStyle(color: Colors.lightGreenAccent,fontSize: 22),),
                              Text("Of $goalTime",style: const TextStyle(color: Colors.white,fontStyle: FontStyle.italic),), 
                            ],
                          ),
                        ),
                        backgroundColor: Colors.black,
                        progressColor: Colors.lightGreenAccent,
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)), 
                          color: Colors.lightGreenAccent,
                        ),
                        child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              Text("Exercise Hour",style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          )
                        ),
                      ), 
                    ],
                  )
                  
                  
                ],
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}