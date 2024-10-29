import "package:flutter/material.dart";
import "package:percent_indicator/circular_percent_indicator.dart";

class HealthMonitor extends StatelessWidget{
  const HealthMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 26, 26, 26),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            blurStyle: BlurStyle.normal,
            color: Colors.black,
            offset: Offset(1, 1),
          )
        ]
      ),
      child: Column(
        children: [
          
          const ListTile(
            leading: Icon(Icons.monitor_heart_rounded,color: Colors.lightGreen,),
            title:Text("Status",style: TextStyle(color: Colors.lightGreen,fontWeight: FontWeight.bold,fontSize: 24),),
          ),
          Container(
            alignment: Alignment.center,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircularPercentIndicator(
                      startAngle: 220,
                      radius: 40.0,
                      lineWidth: 10.0,
                      percent: 1/8,
                      center: const Icon(Icons.directions_walk,color: Color.fromARGB(255, 255, 145, 0),),
                      backgroundColor: const Color.fromARGB(255, 52, 52, 52),
                      progressColor: const Color.fromARGB(255, 255, 145, 0),
                    ),
                    const SizedBox(height: 10,),
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
                  ],
                ),
                const SizedBox(width: 20,),
                CircularPercentIndicator(
                  startAngle: 220,
                  radius: 60.0,
                  lineWidth: 10.0,
                  percent: 0.6,
                  center:const Text("60 %",style:  TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                  backgroundColor: Colors.black,
                  progressColor: Colors.lightGreenAccent,
                  
                ),
                const SizedBox(width: 20,),
                Column(
                  children: [

                    CircularPercentIndicator(
                      startAngle: 220,
                      radius: 40.0,
                      lineWidth: 10.0,
                      percent: 1000/3700, // Set the progress dynamically
                      center:  const Icon(
                              Icons.bolt_rounded,
                              color: Colors.yellow,
                            ),
                      backgroundColor: const Color.fromARGB(255, 52, 52, 52),
                      progressColor: Colors.yellow,
                    ),
                  ],
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}